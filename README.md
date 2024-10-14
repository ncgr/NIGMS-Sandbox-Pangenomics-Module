# Pangenomics
---------------------------------

## **Contents**

+ [Overview](#overview)
+ [Background](#background)
+ [Before Starting](#before-starting)
+ [Getting Started](#getting-started)
+ [Software Requirements](#software-requirements)
+ [Architecture Design](#architecture-design)
+ [Data](#data)
+ [Funding](#funding)
+ [License for Data](#license-for-data)

## **Overview**

This module will introduce you to (graphical) pangenomics and walk you through a pangenomics pipeline.
Specifically, you will learn how to build a pangenome graph, map reads to the graph, call variants on the mapped reads, and visualize the graph.
All analyses will be performed on the Google Cloud Platform.
The estimated cost for the complete module is $?


## **Background**

A *pangenome* is a collection of genomes from the same species.
Compared to a reference genome, a pangenome is a less biased, more comprehensive representation of sequence preservation and variation within a population.
While the pangenome may provide greater insight into questions related to the genetic and genomic nature of a species, these data require the use of bioinformatics tools that are different than those typically used on reference genomes.
This module aims to introduce you to the idea of *pangenome graphs* and the bioinformatics tools used for their analysis.


## **Before Starting**

This module is designed to run on the Google Cloud Platform (GCP).
Follow the instructions below to prepare to run the module on GCP.

<details>

<summary>Setting up GCP</summary>

1. Create a Google Cloud account
2. Create a Google Cloud project
3. Enable billing for your Google Cloud project
4. Create a Vertex AI Workbench instance
5. Click "OPEN JUPYTERLAB" on your instance to open JupyterLab
6. Clone this repository into JupyterLab

</details>


## **Getting Started**

To begin, we must understand how this repository is organized.
```
└── module_notebooks/
    ├── 00-environment-setup.ipynb
    ├── 01-intro-to-pangenomics.ipynb
    ├── 02-building-graphs-with-pggb.ipynb
    ├── 03-indexing-graphs-with-vg.ipynb
    ├── 04-read-mapping-with-vg.ipynb
    ├── 05-variant-calling-with-vg.ipynb
    ├── 06-searching-graphs-with-blast.ipynb
    └── 07-visualization.ipynb
```

`module_notebooks/` contains Jupyter notebooks - one for each submodule.
To open a notebook, simply double-click on it in your Workbench instance.
To begin this module, open the `00-environment-setup.ipynb` notebook.
This notebook will introduce you to Jupyter notebooks and instruct you on how to install the software for this module.


## **Software Requirements**

The follow software is required for this module and will be installed as part of the `00-environment-setup.ipynb` submodule:

* [PGGB](https://github.com/pangenome/pggb)
* [vg](https://github.com/vgteam/vg)
* [BLAST](https://www.ncbi.nlm.nih.gov/books/NBK569861/)
* [Bandage](https://rrwick.github.io/Bandage/)


## **Architecture Design**


## **Data**


## **Funding**


## **License for Data**

