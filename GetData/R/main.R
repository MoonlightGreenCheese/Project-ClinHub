source("~/GetData/R/init.R")
source("~/GetData/R/DownloadTCGA.R")

# Install and load required libraries
# Set system-default parameter
init()

# Show the list of Firehose datasets
getFirehoseDatasets()

# Show the list of running dates
getFirehoseRunningDates()

# Download BRCA, COAD, PAAD data
BRCA_Data <- LoadData("BRCA", "D:/")
COAD_Data <- LoadData("COAD", "D:/")
PAAD_Data <- LoadData("PAAD", "D:/")

# Get Pheno data
BRCA_pData <- GetPhenoData(BRCA_Data)
COAD_pData <- GetPhenoData(COAD_Data)
PAAD_pData <- GetPhenoData(PAAD_Data)

# Get Experiment data
BRCA_Experiment <- GetExpressionSet(BRCA_Data)
COAD_Experiment <- GetExpressionSet(COAD_Data)
PAAD_Experiment <- GetExpressionSet(PAAD_Data)

colData(BRCA_Experiment)@rownames

BRCA_MAE <- MultiAssayExperiment(list("RNASeq2GeneNorm" = BRCA_Experiment), colData = BRCA_pData)
