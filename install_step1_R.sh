#!/bin/bash
echo "==== install R packages ===="
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/Archive/LatticeKrig/LatticeKrig_8.4.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "install.packages('rts', repos='https://cran.rstudio.com')"
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/doMPI_0.2.2.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
git clone https://github.com/cran/rgcvpack.git
Rscript -e "packageurl<-'rgcvpack'; install.packages(packageurl, repos=NULL, type='source')"
git clone https://github.com/chr1swallace/random-functions.git
Rscript -e "packageurl<-'random-functions'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "packageurl<-'../eobs'; install.packages(packageurl, repos=NULL, type='source')"
