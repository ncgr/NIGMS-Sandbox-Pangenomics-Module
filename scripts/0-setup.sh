# conda environment name
CONDA_ENV_NAME="nigms-pangenomics"

# update conda
conda update -n base -c conda-forge conda -y

# set up Bioconda
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# create and activate a conda environment
conda create -n ${CONDA_ENV_NAME} -y
conda activate ${CONDA_ENV_NAME}

# install pggb
conda install -c conda-forge pggb -y

# build the Bandage docker container
docker build -t bandage ./bandage

# create firewall rule for Bandage
INSTANCE_NAME=$(curl http://metadata.google.internal/computeMetadata/v1/instance/name -H Metadata-Flavor:Google)
gcloud compute firewall-rules create bandage --allow tcp:8443 --source-tags=$INSTANCE_NAME --source-ranges=0.0.0.0/0 --description="Port for viewing Bandage GUI via KasmVNC Docker container"

# install other software here...

# add the conda environment as a Jupyter kernel
conda install ipykernel -y
DL_ANACONDA_ENV_HOME="${DL_ANACONDA_HOME}/envs/${CONDA_ENV_NAME}"
python -m ipykernel install --prefix "${DL_ANACONDA_ENV_HOME}" --name ${CONDA_ENV_NAME} --display-name "${CONDA_ENV_NAME}"
