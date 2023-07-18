install_libs <- function(){
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

  if (!requireNamespace("GEOquery", quietly = TRUE))
    BiocManager::install("GEOquery")

  if (!requireNamespace("TCGAbiolinks", quietly = TRUE))
    BiocManager::install("TCGAbiolinks")

  if (!requireNamespace("MultiAssayExperiment", quietly = TRUE))
    BiocManager::install("MultiAssayExperiment")

  if (!requireNamespace("SummarizedExperiment", quietly = TRUE))
    BiocManager::install("SummarizedExperiment")

  if (!requireNamespace("GenomicRanges", quietly = TRUE))
    BiocManager::install("GenomicRanges")

  if (!requireNamespace("RaggedExperiment", quietly = TRUE))
    BiocManager::install("RaggedExperiment")

  if (!requireNamespace("RTCGAToolbox", quietly = TRUE))
    BiocManager::install("RTCGAToolbox")

  if (!requireNamespace("DT", quietly = TRUE))
    BiocManager::install("DT")
}

load_libs <- function(){
  library(GEOquery)
  library(TCGAbiolinks)
  library(MultiAssayExperiment)
  library(DT)
  library(SummarizedExperiment)
  library(GenomicRanges)
  library(RaggedExperiment)
  library(RTCGAToolbox)
}

init <- function(){
  install_libs()
  load_libs()
  # Set time limit for downloading to 1000 (default 60)
  options(timeout = 1000)
}
