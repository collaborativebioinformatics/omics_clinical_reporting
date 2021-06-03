# File: Combine.R
# Purpose: Integrate results from Variant Calling and Differential Expression
#          workflows into a unified tsv file for each sample.
#          
# Usage:   Update path, set infile names to catch pipeline outputs
# Author:  Adam Faranda
# Created: June 3, 2021
###################################################################################

###################### Setup Environment and Import Tables ########################
if(!"dplyr" %in% row.names(installed.packages())){
  install.packages("BiocManager", repos = "https://cloud.r-project.org")
}
if(!"tidyr" %in% row.names(installed.packages())){
  install.packages("tidyr", repos = "https://cloud.r-project.org")
}
if(!"tibble" %in% row.names(installed.packages())){
  install.packages("tibble", repos = "https://cloud.r-project.org")
}
if(!"BiocManager" %in% row.names(installed.packages())){
  install.packages("BiocManager", repos = "https://cloud.r-project.org")
  BiocManager::install(version = "3.13")
  BiocManager::install("VariantAnnotation")
}

library(dplyr)


wd <- "~/expression_and_SNPs_to_clinic/"   # Update Path
setwd(wd)
### GATK Variants from DNA Seq
dna_fn <- "dna_vcf.vcf"
dna_seq_var <- VariantAnnotation::readVcf(paste0(wd,dna_fn))

### GATK Variants from RNA Seq
rna_fn <- "rna_vcf.vcf"
rna_seq_var <- VariantAnnotation::readVcf(paste0(wd,rna_fn))

### Differential Expression (Tumor vs Normal)
deg_fn
deg_table

######################### Generate Unified Identifier Table ##################

### Table consists of the Union of all distinct mutations observed 
### in the patient's Normal and Tumor samples
###
### Table Specification:
###     Variant HGVS expression
###     Hugo gene identifier
###     Variant sequence ontology consequence
###     ClinVar annotation
###     COSMIC annotation
###     Variant zygosity
###     Gene-level differential expression value (logFC, FDR, Abundances)
###     Source (DNA,RNA,Both)
###     Source identifier / Tissue origin, if relevant (Essential)

## Cleanup ALT due to bug in dataframe conversion
dna_seq_mcl <- GenomicRanges::mcols(dna_seq_var)
dna_seq_mcl$REF <- as.character(unstrsplit(dna_seq_mcl$REF))
dna_seq_mcl$ALT <- as.character(unstrsplit(dna_seq_mcl$ALT))

dna_seq <- as.data.frame(
  dna_seq_mcl
) %>%
  tibble::rownames_to_column(var="mutation_id") %>%
  select(
    -paramRangeID
  )

## Cleanup ALT due to bug in dataframe conversion
rna_seq_mcl <- GenomicRanges::mcols(rna_seq_var)
rna_seq_mcl$REF <- as.character(unstrsplit(rna_seq_mcl$REF))
rna_seq_mcl$ALT <- as.character(unstrsplit(rna_seq_mcl$ALT))

rna_seq <- as.data.frame(
  rna_seq_mcl
) %>%
  tibble::rownames_to_column(var="mutation_id") %>%
  select(
    -paramRangeID
  )

variants <- bind_rows(
  dna_seq %>%
    mutate(Source = "DNA"),
  rna_seq %>%
    mutate(Source = "RNA")
) %>%
  group_by(
    mutation_id, REF, ALT, QUAL, FILTER
  ) %>%
  summarise(
    Source=ifelse(n()==1, Source, "BOTH")
  ) %>% as.data.frame()


### Select Columns in Each VCF that represent a unique mutation (primary key)

### Construct a union table of distinct mutation keys (or mutation/gene keys)

### Join Genes and differential expression to mutations

### Generate Results Set







