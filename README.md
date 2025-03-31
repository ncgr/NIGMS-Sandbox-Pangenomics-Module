![Modle Anchor](images/anchor.png)

# NIGMS Sandbox: Pangenomics Module
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
+ [Wrapping Up](#wrapping-up)

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

See the [Vertex AI Quickstart instructions](https://cloud.google.com/vertex-ai/docs/workbench/instances/create-console-quickstart) for details on steps 1-5.

1. Create a Google Cloud account
2. Create a Google Cloud project
3. Enable billing for your Google Cloud project
4. Go to Vertex AI Workbench and create a new instance using "CREATE NEW" -> "ADVANCED OPTIONS". The configurations for each page are described below. Click the "Continue" button at the bottom of each page to go to the next page. **Any configuration not explicitly mentioned below should use its default setting**.
   * Details:<br/>&emsp;Name: nigms-pangenomics-module (this is optional; you can use whatever name you want or the default)<br/>&emsp;Region: us-east4<br/>&emsp;Zone: us-east4-a<br/>&emsp;Workbench type:<br/>&emsp;&emsp;Type: Instance
   * Environment:<br/>&emsp;JupyterLab Version: JupyterLab 4.x
   * Machine type:<br/>&emsp;Series: N2<br/>&emsp;Machine type: n2-standard-4<br/>&emsp;Idle shutdown:<br/>&emsp;&emsp;Enable Idle Shutdown: Checked<br/>&emsp;&emsp;Time of inactivity before shutdown (Minutes): 60
   * Disks: Use default settings
   * Networking:<br/>&emsp;Assign external IP address: Checked<br/>&emsp;Allow proxy access: Checked
   * IAM and security<br/>&emsp;Security options:<br/>&emsp;&emsp;Root access to the instance: Checked<br/>&emsp;&emsp;File downloading: Checked<br/>&emsp;&emsp;Terminal access: Checked
   * System health: Use default settings
  
   The last configuration page - System health - will not have a "Continue" button. Instead, use the "Create" button below the page to create the Vertex AI Workbench instance you just configured.
6. Click "OPEN JUPYTERLAB" on your instance to open JupyterLab

</details>

<details>
 
<summary>Installing Software</summary>

To install the software for this module in JupyterLab, open a Terminal (File -> New Launcher -> Terminal) and run the following commands:
```bash
cd ~
git clone https://github.com/ncgr/NIGMS-Sandbox-Pangenomics-Module.git
bash -i ./NIGMS-Sandbox-Pangenomics-Module/scripts/0-setup.sh
```
After the last command completes, close the terminal and restart the instance in the Vertex AI Workbench.

There should now be a new kernal in the JupyterLab launcher called "nigms-pangenomics".
This is the kernel you should use with every notebook in the module.
The launcher should also contain two new sections: "Submodule Notebooks" and "Visualization Software".
Submodule notebooks contains an ordered list of the notebooks in this module, one for each submodule.
Clicking on a submodule will open the corresponding notebook.
Visualization Software contains a list of visualization software used in this module.
Clicking on a program in this list will open the program in a new window in your Web Browser.

</details>


## **Getting Started**

After following the [Before Starting](#before-starting) instructions, the JupyterLab launcher (File -> New Launcher) will contain a "Submodule Notebooks" section.
This section contains an ordered list of the notebooks in this module, one for each submodule.
Clicking on a submodule in this section will open the corresponding notebook.
To begin, click on the "Environment Setup."

Alternatively, you can use the JupyterLab file browser.
Here is the location and file structure of the module notebooks:
```
NIGMIS-Sandbox-Pangenomics-Module/
└── module_notebooks/
    ├── 00-environment-setup.ipynb
    ├── 01-intro-to-pangenomics.ipynb
    ├── 02-building-graphs-with-pggb.ipynb
    ├── 03-searching-graphs-with-blast.ipynb
    ├── 04-visualization.ipynb
    ├── 05-indexing-graphs-with-vg.ipynb
    ├── 06-read-mapping-with-vg.ipynb
    └── 07-variant-calling-with-vg.ipynb
```
`module_notebooks/` contains Jupyter notebooks - one for each submodule.
To open a notebook, simply double-click on it it.
To begin this module, open the `00-environment-setup.ipynb` notebook.


## **Software Requirements**

The following software is required for this module:

* [PGGB](https://github.com/pangenome/pggb)
* [vg](https://github.com/vgteam/vg)
* [BLAST](https://www.ncbi.nlm.nih.gov/books/NBK569861/)
* [Bandage](https://rrwick.github.io/Bandage/)
* [Samtools](https://www.htslib.org/)

All of these programs can be installed in JupterLab running on the GCP Vertex AI Workbench following the Installing Software instructions in the [Before Starting](#before-starting) section.


## **Architecture Design**


## **Data**


## **Funding**


## **License for Data**

## **Wrapping Up**
