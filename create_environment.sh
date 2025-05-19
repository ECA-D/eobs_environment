#!/bin/bash
conda install python=3.11.6
conda install --file conda_env.txt -vvv

Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/Archive/LatticeKrig/LatticeKrig_8.4.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "install.packages('rts', repos='https://cran.rstudio.com')"
# Rscript -e "packageurl<-'eobs_2025_05_14.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
# Rscript -e "packageurl<-'random_functions_2025_05_15.tag.gz'; install.packages(packageurl, repos=NULL, type='source')"
