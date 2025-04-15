# Differential-Expression-Reports
This repository contains scripts for generating interactive RNAseq analysis reports using DESeq2 output and R Markdown templates. The main script provides a command-line interface (CLI) using the `argparse` package so you can easily customize the parameters such as the output directory, DESeq2 object file, R Markdown template, control group name, and several optional settings (e.g., p-value cutoff, fold change cutoff, normalization method).

## Repository Contents
- **generate_report.R**  
  The main R script that parses command-line arguments, installs and loads required packages, and renders an R Markdown report based on user-specified parameters.

- **RNAseq_Analysis.Rmd**  
  An R Markdown template that defines report parameters in its YAML header along with analysis code chunks. These include generating MA plots, PCA plots, volcano plots, and dynamic heatmaps.

- **README.md**  
  This file, which describes the project and how to use the scripts.

## Features
- **Parameterization:**  
  The R Markdown template declares default parameters (e.g., `dds_object`, `p_value_cutoff`, `fc_cutoff`, `control_name`, etc.). These defaults can be overridden at runtime by passing parameters via the CLI.

- **Dynamic Package Management:**  
  The script automatically installs any missing CRAN or Bioconductor packages so you don't have to manually install dependencies.

- **Dynamic Visualization Adjustments:**  
  The heatmap visualization's width is dynamically adjusted based on the number of samples, and the sample labels can be rotated vertically to save space.

## Requirements
- R (version 3.6 or later is recommended)
- The following R packages (the script will install these if they are missing):
  - `argparse`
  - `rmarkdown`
  - `DESeq2` (via **BiocManager**)
  - `plotly`
  - `DT`
  - `htmltools`
  - `heatmaply`
  - `viridis`

## Installation
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/rnaseq-analysis-report-generator.git
   cd rnaseq-analysis-report-generator
