<img width="1017" alt="Screenshot 2021-06-02 at 02 16 34" src="https://user-images.githubusercontent.com/41301333/120476740-dd4f1d80-c3a2-11eb-9c81-248f56bfb84f.png">
# omics_clinical_reporting
Clinical_Report_Design_for_omics_integration

# Goal

To develop a tool to facilitate reporting of multiomics data. The tool generates two reports, one is aimed for clinical use and the second aimed for researchers, informing the interpretation of genetic variants pertaining to the gene provided by the user.

# Introduction

Many multi-omics datasets of different diseases have been generated and the availability of many new analytical tools are now for the first time allowing the combining of all of these resources in several ways in clinical reporting. The identification of biologically meaningful targets using multi-omics data will allow for better stratification, more targeted treatments, and a greater understanding of disease mechanisms.

# Installation 

Omics-ReportR is available in GitHub https://github.com/collaborativebioinformatics/omics_clinical_reporting 

# Methods

## Implementation 

## Inputs

currently planning to have inputs come from a SQLITE table

## Outputs

The tool generates two reports, one is aimed for clinical use and the second aimed for researchers, informing the interpretation of genetic variants pertaining to the gene provided by the user.



## Operation

Omics-ReportR requires a SQLITE table that includes all the variants that should be genotyped (Flow chart).

#Flow Chart


<img width="852" alt="Screenshot 2021-06-02 at 13 08 20" src="https://user-images.githubusercontent.com/41301333/120477397-a4637880-c3a3-11eb-9ebd-1ae1a18f11a2.png">



1-EXPERT VIEW

  Gene-level summary in addition to information about associated disease.
  Links to the gene's page on OMIM, GTEx, gnomAD.
  A dynamic table with the annotated variants overlapping the gene.
  A graph with showing summary of all the variants within the gene.
  Chromosome location.
  Table showing summary of gene expression analysis.
  Tissue specific gene expression summary table.
  PRS score
  SV data summary 
 
 2- Patients, non-specialist clinicians

 
genomics data simplification, which genes are overexpressed, how much of a gene is overexpressed (how the cohort respond to a certain treatment regarding this gene), In the gene level summary of the most pathogenic variants identified, each column in the dynamic table can be sorted and searched dynamically, and all data used by the app is available for download in tab-delimited files. By default, allele frequency is reported based on dbVar and gnomAD genomes and exomes. 
The tools provide Link to local genetic counselor, link to clinical trials related to the disease and the gene of interest and five most recent publications about the identified gene.

# Multiomic Risk Score

<img width="596" alt="Screenshot 2021-06-02 at 19 10 16" src="https://user-images.githubusercontent.com/41301333/120531179-400ddc80-c3d6-11eb-8c55-7d76e646c968.png"> 
# omics_clinical_reporting
Clinical_Report_Design_for_omics_integration
