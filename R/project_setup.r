library(usethis)
library(here)
#remotes::install_github('rstudio/pagedown')
library(pagedown)

report_path <- here("omics_clinical_reporting/")
create_project(report_path)


use_rmarkdown_template(template_name = "create_omics_report",
                       template_description = "A quick overview of producing a clinical report from multi-omics sequencing data.")


#Will use this for the template
# pagedown::poster_relaxed()
