# load packages
library(tidyverse)
library(Biobase)
library(CoRegNet)

# set working directory
setwd("/Users/mleukam/Documents/GitHub/foxo")

# load data
foxo_es <- readRDS("output/tcl_eset_foxo3_active.rds")
foxo_expr <- exprs(foxo_es)

# load human transcription factor list from package
data("HumanTF")

# Reconstruct a large-scale regulatory network from gene expression data
grn <- hLICORN(foxo_expr, TFlist = HumanTF)

# save results
saveRDS(grn, "output/grn.rds")
