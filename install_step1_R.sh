# #!/bin/bash
# echo "==== install R packages ===="
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/Archive/LatticeKrig/LatticeKrig_8.4.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
Rscript -e "install.packages('rts', repos='https://cran.rstudio.com')"
Rscript -e "packageurl<-'https://cran.r-project.org/src/contrib/doMPI_0.2.2.tar.gz'; install.packages(packageurl, repos=NULL, type='source')"
if [ -d "rgcvpack" ];
then echo "rgcvpack exists"
else
    git clone https://github.com/cran/rgcvpack.git
fi
Rscript -e "packageurl<-'rgcvpack'; install.packages(packageurl, repos=NULL, type='source')"

if [ -d "random-functions" ];
then echo "random-functions exists"
else
    git clone https://github.com/chr1swallace/random-functions.git
fi
Rscript -e "packageurl<-'random-functions'; install.packages(packageurl, repos=NULL, type='source')"

file_dir=$(dirname "$(realpath $0)")
echo $file_dir
for option in "$file_dir/../eobs" "$file_dir/eobs";
do
    if [ -d "$option" ];
        then
        echo "install "
        Rscript -e "packageurl<-'$option'; install.packages(packageurl, repos=NULL, type='source')"
        exit 0
    else
        echo "EOBS NOT FOUND! at $option"
    fi
done
echo "last resort try cloning from source"
if [ -d "eobs" ];
then
    echo "eobs-folder does exist"
    Rscript -e "packageurl<-'eobs'; install.packages(packageurl, repos=NULL, type='source')"
else
    echo "eobs-folder does not exist - cloning"
    git clone git@github.com:ECA-D/eobs.git
    Rscript -e "packageurl<-'eobs'; install.packages(packageurl, repos=NULL, type='source')"
    echo cleanup eobs folder!
    rm -rf eobs
fi