#!/usr/bin/env bash

# update conda
conda update -n base -c conda-forge conda

# initialize conda
conda init

# set up Bioconda
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# create and activate a conda environment
conda create -n nigms-pangenomics -y
conda activate nigms-pangenomics

# install pggb
conda install -c bioconda pggb
