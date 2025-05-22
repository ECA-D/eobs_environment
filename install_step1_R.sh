#!/bin/bash
echo "==== install R packages ===="
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/Archive/LatticeKrig/LatticeKrig_8.4.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "install.packages('rts', repos='https://cran.rstudio.com')"
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/doMPI_0.2.2.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "library(devtools); install_github("chr1swallace/random-functions")"
# TODO these need to be added later
# Rscript -e "packageurl<-'eobs_2025_05_14.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
