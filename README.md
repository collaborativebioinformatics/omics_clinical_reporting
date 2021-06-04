<img width="1017" alt="Screenshot 2021-06-02 at 02 16 34" src="https://user-images.githubusercontent.com/41301333/120476740-dd4f1d80-c3a2-11eb-9c81-248f56bfb84f.png">
# omics_clinical_reporting
Clinical_Report_Design_for_omics_integration

# Contributors

Jenny Smith: jennyl.smith12@gmail.com 
Ames Ma: ama@dnanexus.com 
Ahmad Al Khleifat: ahmad.al_khleifat@kcl.ac.uk 
Ray Funahashi: rwf13@pitt.edu 
Priyanshu Jain: priyanshuj0410@gmail.com 
Aishwarya Chander: aishwaryachander3@gmail.com 
Jędrzej Kubica: jj.kubica@student.uw.edu.pl 


# Goal

To develop a tool to facilitate reporting of multiomics data. The tool generates two reports, one is aimed for clinical use and the second aimed for researchers, informing the interpretation of genetic variants pertaining to the gene provided by the user.

# Introduction

Many multi-omics datasets of different diseases have been generated and the availability of many new analytical tools are now for the first time allowing the combining of all of these resources in several ways in clinical reporting. The identification of biologically meaningful targets using multi-omics data will allow for better stratification, more targeted treatments, and a greater understanding of disease mechanisms.


<figcaption>Example of CSS and HTML templates to be created for the UX implementation. </figcaption>

# Installation 

Omics-ReportR is available in GitHub https://github.com/collaborativebioinformatics/omics_clinical_reporting 

# Methods

## Implementation 

## Inputs

SQLITE table

## Outputs

The tool generates two reports, one is aimed for clinical use and the second aimed for researchers, informing the interpretation of genetic variants pertaining to the gene provided by the user.



## Operation

Omics-ReportR requires a SQLITE table that includes all the variants that should be genotyped (Flow chart).

#Flow Chart

![diagram flow chart](https://user-images.githubusercontent.com/41301333/120810257-c3e4d780-c542-11eb-817b-40d07bd8841d.jpg)



 
genomics data simplification, which genes are overexpressed, how much of a gene is overexpressed (how the cohort respond to a certain treatment regarding this gene), In the gene level summary of the most pathogenic variants identified, each column in the dynamic table can be sorted and searched dynamically, and all data used by the app is available for download in tab-delimited files. By default, allele frequency is reported based on dbVar and gnomAD genomes and exomes. 
The tools provide Link to local genetic counselor, link to clinical trials related to the disease and the gene of interest and five most recent publications about the identified gene.

# UX Research

While the advent of multi-omics data presents us with more opportunities to diagnose and treat health conditions with a genetic component, most clinicians are not bioinformatics experts and may not want to sift through various databases or run their own analyses to understand what the data means for their particular case. 

Clinicians already interface with a wide variety of tools when examining a patient, which are often data-heavy and not user-friendly. Previous research done on medical data visualization has informed the design of our clinical reports. In an article by Pollack and Pratt, the authors mention that clinicians typically search for data that helps them with a specific clinical action such as prescribing medications or ordering tests. They write that “given that physicians typically search for information to help them accomplish a specific clinical task (eg, prescribing medications), well-designed concept-oriented views could provide all the required data elements in a single location to support the task’s successful completion.” While physicians would not make treatment decisions solely based on the results of a genetic report, making clinically relevant data points clearly visible to clinicians can support their decision-making process.

Omics-ReportR will ultimately produce two types of reports, a clinician (non-specialist) report and a genomics researcher (specialist) report. The researcher report will prioritize displaying all available genomics data to the viewer, and will be able to display customized results depending on what types of information the researcher is interested in. The clinician report will contain a summary of -omics data that is relevant to clinical decision-making, allowing clinicians to skim the report if desired. The summary data will also break down the -omics data into clinically relevant and more understandable terms.

A single patient can generate hundreds of pieces of clinical data in the hospital as well, adding to the cognitive burden of the treating physicians. Well-designed reporting supports a clinician’s ability to prioritize the given information, understand the material faster, and reduce the frustration of adapting to new technology. Due to the busy nature of a clinician’s work, we predict that user-friendly, tailored multi-omics reports will result in greater adoption rates as compared to a spreadsheet of data.

# Results 


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
 
 ![Screenshot 2021-06-04 at 14 41 12](https://user-images.githubusercontent.com/41301333/120810613-1f16ca00-c543-11eb-811a-1392b81f620d.png)


![Screenshot 2021-06-04 at 14 41 25](https://user-images.githubusercontent.com/41301333/120810636-22aa5100-c543-11eb-9c31-0c7852d5ef2b.png)


# Formatting and Styling in Rmarkdown

The next steps are to re-create the patient/clinician report using Rmarkdown. This will require the development of a new css and html template. The R package `pagedown` was the inspiration for creating these css/html templates and we will plan on using the the `pagedown` templates to design our own UX design for the report. 
Below are the some images to illustrate the template formats that will need to be created, and are taken from the `pagedown::poster-relaxed` format to start. 

<br/>
<br/>

<p float="left">
  <img alt="example_CSS_template" src="https://user-images.githubusercontent.com/18451714/120823045-d98ada80-c50b-11eb-8e8a-3814c0101d2e.png" width="35%" height="35%" />
  <img alt="example_HTML_template" src="https://user-images.githubusercontent.com/18451714/120823053-db549e00-c50b-11eb-9431-8e73f7ff9e3b.png" width="35%" height="35%" /> 
  <figcaption>Example of CSS and HTML templates to be created for the UX implementation. </figcaption>
</p>

<br/>
<br/>


# References 

* [github submodules](https://github.blog/2016-02-01-working-with-submodules/)
* [Rmarkdown templates](https://rstudio4edu.github.io/rstudio4edu-book/rmd-templates.html)
* [Rmarkdown css](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style)

