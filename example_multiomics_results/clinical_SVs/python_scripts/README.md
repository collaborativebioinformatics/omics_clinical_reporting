VCFanalyse.py
-------------
This script takes a VCF file as input. It analyzes the chromosome by dividing the chromosome into 'n' number of the equal-sized bin (parameter bins) and counts the different types of structural variants (SVs) to plot them as a figure. It allows the user to analyze what parts of the chromosomes are most affected by what type of variation.

**Please note that I have added a VCF parser and data processing functions in the python file(s). In the future, it might be helpful and help other people.**

The parameters for the program are as following
Chromosome ID (eg.. chr1, chr2)
VCF filename (and location if not in the same folder)

Example command:\
`python VCFanalyse.py chr2 NA19461.final.manta.diploidSV.vcf`

Example output for Chromosome 2 for the example command above:\
<img src="https://github.com/collaborativebioinformatics/clinical_SVs/blob/main/python_scripts/output.png">