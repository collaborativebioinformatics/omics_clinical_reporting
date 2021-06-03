# Expression and SNPs to clinic
Smooth transition of called variants from RNAseq/DNAseq and expression to the clinic. 

## Contributors 

- Jyoti Kataria - Sysadmin 
- Amit Yadav - Sysadmin 
- Adam Pater Faranda - Data Guru, Tech support 
- Katarina - Data Guru 
- Varuna Chander - Writer, Tech support 
- Kym Pagel - Lead, Liaison 

## Goal 
Build a streamlined and easy to use workflow for reporting expressed variants from RNAseq to the clinic. 


## Introduction 


We use the CTAT-Mutation pipeline will be used to call expresseed variants from RNAseq data. The CTAT-Mutation pipeline (https://github.com/NCIP/ctat-mutations/wiki) makes it easy to discover variants from RNA-seq data, and requires only the RNA-seq reads as input. The pipeline also annotates variants, including the RADAR and RediPortal databases for identifying likely RNA-editing events, dbSNP and gnomAD for annotating common variants, COSMIC to highlight known cancer mutations, and OpenCRAVAT to annotate and prioritize variants according to likely biological impact and relevance to cancer. The CTAT-Mutations Pipeline integrates GATK Best Practices along with downstream steps to annotate and filter variants, and to additionally prioritize variants that may be relevant to cancer biology. 

We will then use the GATK Best Practices pipeline to call variants from DNAseq. Next, we will identify genes that are differentially expressed. Finally, we will aggregate the variants identified through DNA and RNAseq, and curate extensive clinical annotations using OpenCRAVAT to identify priority variants. 

## Test Data 

In order to thoroughly evaluate this the pipeline we've identified several studies that meet the following basic criteria
- the study provides a matching DNA Sequencing and RNA Seqeuncing reads from same biological sample
- the study provides a meaningful contrast for evaluating differential expression
- reads are paired end.

We've identified a study archived in the Gene Expression Omnibus (Geo Accession:GSE75935) that provides RNA Seq and DNA Seq data from human tissue samples collected from ovarian cancer patients. The data includess three cancer patients, three tumor samples per patient from different sites, two normal tissue samples from two different patients, four cell lines.

| Run         |	AvgSpotLen	| LibrarySource	  | source_name	| patient_identifier |
| --- | --- | --- | --- | --- |
| SRR2989954	| 249	        | GENOMIC	        | Ovarian tumor	| 1 |
| SRR2989955	| 249	        | GENOMIC	        | Peritoneum tumor	| 1 |
| SRR2989956	| 249	        | GENOMIC	        | Lymph node tumor	| 1 | 
| SRR2989957	| 249	        | GENOMIC	        | Ovarian tumor	| 2 |
| SRR2989958	| 249	        | GENOMIC         |	Peritoneum tumor	| 2 |
| SRR2989959	| 249	        | GENOMIC        	| Lymph node tumor	| 2 |
| SRR2989960	| 209	        | GENOMIC	        | Ovarian tumor	| 3 |
| SRR2989961	| 249	        | GENOMIC	        | Peritoneum tumor	| 3 |
| SRR2989962	| 249	        | GENOMIC        	| Lymph node tumor	| 3 |
| SRR2989963	| 199	        | GENOMIC	        | Normal ovary	| 1 |
| SRR2989964	| 199	        | GENOMIC	        | Normal ovary	| 2 |
| SRR2989969	| 96	        | TRANSCRIPTOMIC	| Ovarian tumor | 	1 |
| SRR2989970	| 96	        | TRANSCRIPTOMIC	| Peritoneum tumor	| 1 |
| SRR2989971	| 96        	| TRANSCRIPTOMIC	| Lymph node tumor	| 1 |
| SRR2989972	| 96	        | TRANSCRIPTOMIC	| Ovarian tumor	| 2 |
| SRR2989973	| 96	        | TRANSCRIPTOMIC	| Peritoneum tumor	| 2 |
| SRR2989974	| 96	        | TRANSCRIPTOMIC	| Lymph node tumor	| 2 |
| SRR2989975	| 96	        | TRANSCRIPTOMIC	| Ovarian tumor	| 3 |
| SRR2989976	| 96        	| TRANSCRIPTOMIC	| Peritoneum tumor	| 3 |
| SRR2989977	| 96        	| TRANSCRIPTOMIC	| Lymph node tumor	| 3 |

## Installation 

To add the Trinity CTAT applet, use the following comamnd:
java -jar dxWDL-v1.50.jar compile ctat_mutations_2pt5.wdl -project project-ID

To add the OpenCRAVAT applet, use the following comamnd:
java -jar dxWDL-v1.50.jar compile oc-run.wdl -project project-ID

There are two separate DNA Nexus workflows for DNAseq and RNAseq processing. These will be made publicly available. 


## Methods
1. Obtain high quality test data
1. Construct the variant calling and annotation pipeline
1. Construct the gene expression analysis pipeline 
1. Document the pipeline thoroughly 
1. Construct output file for OMOP group

### Implementation 

#### Inputs 

I. DNAseq Workflow:

1. BWA FASTA indexer: Indexes a FASTA reference genome sequence for downstream use by the BWA-backtrack and BWA-MEM mapping apps.
Input: Reference FASTA file (UCSC hg19)
Output:BWA FASTA index file 

2. BWA-MEM mapping: Maps FASTQ (paired or unpaired reads) to reference genome using BWA-MEM algorithm. Marks duplicates.
Inputs: DNA paired end fastq files and BWA FASTA index file 
Outputs: Sorted BAM file and Index BAM file

3. GATK4 base recalibration: Recalibrates base quality scores


4. GATK4 Haplotype caller


5. GATK4 Genotyping


----------//-------------//---------------------

II.  RNAseq Workflow:
1. Trinity CTAT: RNAseq fastq file and Reference genome
1. DESeq2: RNAseq fastq file


III.  CombineR
- This is a custom script that is a work-in-progress


#### Outputs 

A TSV-delimited file per sample. Each line describes one variant, including the following fields: 
- Variant HGVS expression 
- Hugo gene identifier 
- Variant sequence ontology consequence
- ClinVar annotation
- COSMIC annotation 
- Variant zygosity 
- Gene-level differential expression value
- Source (DNA,RNA,Both)
- Source identifier / Tissue origin, if relevant 

## Operation 


## Flowchart
<img width="429" alt="flowchart_for_rupesh" src="https://user-images.githubusercontent.com/5508556/120688832-76e50080-c471-11eb-8cb3-baf033cd14b9.png">
Flowchart of the pipeline

## Results 
Still working on this! 

## References 

- Data: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE75935 
- CTAT pipeline https://github.com/NCIP/ctat-mutations/wiki 
- OpenCRAVAT https://www.cancergeneticsjournal.org/article/S2210-7762(20)30193-9/pdf 
- GATK Best Practices https://gatk.broadinstitute.org/hc/en-us/sections/360007226651-Best-Practices-Workflows 
- DSeq2 https://bioconductor.org/packages/release/bioc/html/DESeq2.html 
- ViraVate https://github.com/collaborativebioinformatics/Differential_Expression_and_Variant_Association 
- DNANexus documentation https://documentation.dnanexus.com/developer/apps/execution-environment/connecting-to-jobs 
