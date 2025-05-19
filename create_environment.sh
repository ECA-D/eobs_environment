#!/bin/bash
echo "==== install python 3.11 ===="
conda install python=3.10
echo "==== install conda-forge libraries ===="
conda install --file conda_env.txt -vv

echo "==== install R packages ===="
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/Archive/LatticeKrig/LatticeKrig_8.4.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "install.packages('rts', repos='https://cran.rstudio.com')"
# Rscript -e "packageurl<-'eobs_2025_05_14.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
# Rscript -e "packageurl<-'random_functions_2025_05_15.tag.gz'; install.packages(packageurl, repos=NULL, type='source')"
