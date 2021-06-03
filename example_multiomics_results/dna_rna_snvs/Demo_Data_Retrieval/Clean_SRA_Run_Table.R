# File: Clean_GSE75935_SRA_Run_Table.R
# Purpose: Remove unwanted columns and extract meaningful 
#         covariates for SRA Samples
# Usage: Update "wd" to correct path and execute this script
# Author: Adam Faranda
# Created: June 3, 2021
###################################################################################

library(dplyr)
wd <- "~/expression_and_SNPs_to_clinic/Demo_Data_Retrieval/"   # Update Path
infile <- "GSE75935_SRA_Run_Table.txt" 
sra <- read.csv(infile)

## Get rid  of unwanted columns
sra <- sra %>%
  select(
    -AssemblyName, -Bases, -BioProject, -Bytes, -Center.Name, -Consent, 
    -DATASTORE.filetype, -DATASTORE.provider, -DATASTORE.region, -Experiment,
    -Assay.Type, -LibraryLayout, -LibrarySelection, -Organism, -Platform,
    -ReleaseDate, -Sample.Name, -Instrument, -SRA.Study, -BioSample, 
    -Tissue, -tumor_site
    
  )

## Create Separate Metadata Tables For Humans and Cell lines
sra.human <- sra %>%
  filter(!is.na(patient_identifier)) %>%
  select(
    -cell_line, -cell_type
  )

write.table(
  sra.human, row.names = F, sep="\t", quote = F,
  file = "GSE75935_SRA_Run_Table_Clean_Human.tsv"
)

sra.cells <- sra %>%
  filter(is.na(patient_identifier)) %>%
  select(
    Run, AvgSpotLen, LibrarySource, cell_line, cell_type
  )

write.table(
  sra.cells, row.names = F, sep="\t", quote = F,
  file = "GSE75935_SRA_Run_Table_Clean_Cells.tsv"
)

  

