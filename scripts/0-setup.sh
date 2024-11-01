# install Mamba
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b

# mamba environment name
MAMBA_ENV_NAME="nigms-pangenomics"

# set up Bioconda
mamba config --add channels bioconda
mamba config --add channels conda-forge
mamba config --set channel_priority strict

# create and activate a mamba environment
mamba create -n ${MAMBA_ENV_NAME} -y
mamba activate ${MAMBA_ENV_NAME}

# install pggb
mamba install -c conda-forge pggb -y

# install other software here...

# add the mamba environment as a Jupyter kernel
mamba install ipykernel -y
DL_ANACONDA_ENV_HOME="${DL_ANACONDA_HOME}/envs/${MAMBA_ENV_NAME}"
python -m ipykernel install --prefix "${DL_ANACONDA_ENV_HOME}" --name ${CONDA_ENV_NAME} --display-name "mamba-${CONDA_ENV_NAME}"
