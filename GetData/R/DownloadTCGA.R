LoadData <- function(dataset, targetPath){
  # Download BRCA data
  DIR <- paste(targetPath, dataset, sep = "")

  if (!dir.exists(DIR)){
    dir.create(DIR)
  }

  Data <- getFirehoseData(
    dataset = dataset,
    RNASeqGene = FALSE,
    RNASeq2Gene = FALSE,
    clinical = TRUE,
    miRNASeqGene = FALSE,
    miRNASeqGeneType = "read_count",
    RNASeq2GeneNorm = TRUE,
    CNASNP = FALSE,
    CNVSNP = FALSE,
    CNASeq = FALSE,
    CNACGH = FALSE,
    Methylation = FALSE, # File path too long, to be discussed ...
    Mutation = FALSE,
    mRNAArray = FALSE, # File path too long, covered by RNA_NORM
    miRNAArray = FALSE,
    RPPAArray = FALSE,
    GISTIC = FALSE,
    RNAseqNorm = "raw_count",
    RNAseq2Norm = "normalized_counts",
    destdir = DIR,
    forceDownload = TRUE,
    fileSizeLimit = 1000,
    getUUIDs = FALSE
  )
  return(Data)
}

GetPhenoData <- function(data){
  # Exstract Clinical data (to Bioconductor Classes)
  Clinical <- biocExtract(data, "clinical")

  # Clinical row names - dots to dashes, lower to upper
  i <- 1
  for (val in rownames(Clinical)){
    val <- gsub('\\.', '-', toupper(val))
    rownames(Clinical)[i] <-val
    i <- i + 1
  }
  return(Clinical)
}

GetExpressionSet <- function(data){
  ExpSet <- biocExtract(data, "RNASeq2GeneNorm")
  return(ExpSet)
}

TCGA_2_MAE <- function(experiments, pData, fData = NULL){
  mae <- MultiAssayExperiment()
  mae <- addAssay(mae, data = experiments, assay_type = "GeneExpression")
  mae <- metadata(mae, sample_data = pData, feature_data = fData)
  mae <- validate(mae)
  return(mae)
}
