# Differential-Expression-Reports
This repository contains scripts for generating interactive RNAseq analysis reports using any DESeq2 (dds) output and R Markdown templates. The main script provides a command-line interface (CLI) using the `argparse` package so you can easily customize the parameters such as the output directory, DESeq2 object file, R Markdown template, control group name, and several optional settings (e.g., p-value cutoff, fold change cutoff, normalization method).

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

When the report is generated, it includes the following sections:

- **Parameter Summary Table:**  
  A table that displays the parameters used in the analysis. This includes the file paths for the DESeq2 object and the R Markdown template, p-value cutoff, fold change cutoff, control group name, normalization method, and other key inputs.

- **MA Plots:**  
  Interactive MA plots for each condition vs. control, showing log2 fold changes against the base mean expression with gene-level details available on hover.

- **PCA Plot:**  
  A principal component analysis plot that clusters and visualizes samples based on normalized gene expression data.

- **Volcano Plots and Expression Summary Tables:**  
  Interactive volcano plots that visualize differential expression alongside summary tables listing upregulated and downregulated genes.

- **Dynamic Heatmap:**  
  A heatmap displaying the top 50 genes by variance, with dynamic width adjusted according to the number of samples and vertical sample labels for better space utilization.

These visualizations are designed to be interactive, making it easier to explore your RNAseq data results.

## Requirements
- The following R packages (the script will install these if they are missing):
  - `argparse`
  - `rmarkdown`
  - `DESeq2` (via **BiocManager**)
  - `plotly`
  - `DT`
  - `htmltools`
  - `heatmaply`
  - `viridis`
    
 ## Sample Command
  Rscript generate_report.R \
  --output_dir "/path/to/output" \
  --dds_object "/path/to/dds_object.rds" \
  --rmd_file "/path/to/RNAseq_Analysis.Rmd" \
  --control_name "WT" \
  --p_value_cutoff 0.05 \
  --fc_cutoff 1.5 \
  --normalization_method "vst" \
  --use_adjusted_pvalue FALSE

