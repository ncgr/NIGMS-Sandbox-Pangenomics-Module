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

# install other software here...

# add the conda environment as a Jupyter kernel
conda install ipykernel -y
DL_ANACONDA_ENV_HOME="${DL_ANACONDA_HOME}/envs/${CONDA_ENV_NAME}"
python -m ipykernel install --prefix "${DL_ANACONDA_ENV_HOME}" --name ${CONDA_ENV_NAME} --display-name "${CONDA_ENV_NAME}"
