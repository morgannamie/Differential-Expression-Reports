#!/usr/bin/env Rscript

#Install argparse and rmarkdown libraries

#Install and load argparse
if (!requireNamespace("argparse", quietly = TRUE)) {
  install.packages("argparse", repos = "https://cloud.r-project.org")
}
suppressPackageStartupMessages(library(argparse))

#Install and load rmarkdown
if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  install.packages("rmarkdown", repos = "https://cloud.r-project.org")
}
suppressPackageStartupMessages(library(rmarkdown))


parser <- ArgumentParser(
  description = "Generate RNAseq analysis report from a DESeq2 object using an R Markdown template."
)

#Required parameters
parser$add_argument("--output_dir", required = TRUE, help = "Output directory for the HTML report")
parser$add_argument("--dds_object", required = TRUE, help = "Path to the saved DESeq2 object (.rds)")
parser$add_argument("--rmd_file", required = TRUE, help = "Path to the .Rmd file template")
parser$add_argument("--control_name", required = TRUE, help = "Control group name in the data")

#Optional parameters with defaults
parser$add_argument("--p_value_cutoff", type = "double", default = 0.05, help = "P-value cutoff for significance [default: 0.05]")
parser$add_argument("--fc_cutoff", type = "double", default = 1.50, help = "Fold change cutoff for significance [default: 1.50]")
parser$add_argument("--normalization_method", default = "vst", help = "Normalization method (vst or rlog) [default: 'vst']")
parser$add_argument("--use_adjusted_pvalue", type = "logical", default = FALSE, help = "Use adjusted p-values for significance [default: FALSE]")

#Parse the command-line arguments
args <- parser$parse_args()

# --- Build the parameters list to pass to the R Markdown document ---
params <- list(
  dds_object = args$dds_object,
  p_value_cutoff = args$p_value_cutoff,
  fc_cutoff = args$fc_cutoff,
  control_name = args$control_name,
  normalization_method = args$normalization_method,
  use_adjusted_pvalue = args$use_adjusted_pvalue,
  output_dir = args$output_dir
)

#Check for creation of output directory
if (!dir.exists(params$output_dir)) {
  dir.create(params$output_dir, recursive = TRUE)
}

#Render RMD file
render(
  args$rmd_file,
  output_file = file.path(params$output_dir, "RNAseq_analysis_report.html"),
  params = params,
  envir = new.env()
)
