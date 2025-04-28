# install system dependencies
sudo apt-get update
sudo apt-get install docker-compose-plugin

# conda environment name
CONDA_ENV_NAME="nigms-pangenomics"

# absolute path to repo's scripts/ directory
SCRIPTS_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
SCRIPTS_PATH="$(cd -- "$SCRIPTS_PATH" && pwd)"

# update conda
conda update -n base -c conda-forge conda -y

# set up Bioconda
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# install the JupyterLab App Launcher extension
conda activate jupyterlab4-preview
pip install jupyter_app_launcher
conda dactivate

# copy the JupyterLab App Launcher config directory into the Jupyter path
cp -r $SCRIPTS_PATH/jupyter_app_launcher/ ~/.local/share/jupyter/

# copy the bash_profile to the Jupyter home directory
cp -r $SCRIPTS_PATH/.bash_profile ~/

# create and activate a conda environment
conda create -n ${CONDA_ENV_NAME} -y
conda activate ${CONDA_ENV_NAME}

# install pggb
conda install -c conda-forge pggb=0.7.4 -y

# install gfatools
conda install gfatools=0.5 -y

# build the Bandage container and run it as a daemon
docker compose -f $SCRIPTS_PATH/../bandage/compose.yml up -d

# create firewall rule for Bandage
INSTANCE_NAME=$(curl http://metadata.google.internal/computeMetadata/v1/instance/name -H Metadata-Flavor:Google)
gcloud compute firewall-rules create $INSTANCE_NAME-bandage --allow tcp:8443 --source-tags=$INSTANCE_NAME --source-ranges=0.0.0.0/0 --description="Port for viewing Bandage GUI running in KasmVNC Docker container"

# install the same BLAST as the Bandage container
$SCRIPTS_PATH/../bandage/install-blast.sh

# install SRA Tools
$SCRIPTS_PATH/1-install-sra-tools.sh

# install other software here...

# set conda environment variables
conda env config vars set PATH="$PATH:~/ncbi-blast-2.16.0+/bin:/usr/local/ncbi/sra-tools/bin"

# add the conda environment as a Jupyter kernel
conda install ipykernel -y
DL_ANACONDA_ENV_HOME="${DL_ANACONDA_HOME}/envs/${CONDA_ENV_NAME}"
python -m ipykernel install --prefix "${DL_ANACONDA_ENV_HOME}" --name ${CONDA_ENV_NAME} --display-name "${CONDA_ENV_NAME}"

# copy custom JupyterLab content to Jupyter config folder
cp $SCRIPTS_PATH/../jupyter/jupyter_lab_config.py ~/.jupyter/
cp -r $SCRIPTS_PATH/../jupyter/custom/ ~/.jupyter/
