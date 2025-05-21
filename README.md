# eobs_environment
Software environment for running E-OBS code

*This repository is in a testing phase*

## How to use
This repository is the testbed for testing the installation procedure for `eobs` code.

The goal of the repository is to assure one can easily install the required dependencies (mostly `R`) required for the `eobs` code and related scripts.

When working with the latest version of `eobs` and `E-OBS_batch` (both from this organization), one should be able to install everything (on a linux host).

### 1. Install `miniforge`

Run the following commands, and follow the install guide of miniforge:
```bash
wget https://github.com/conda-forge/miniforge/releases/download/25.3.0-3/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

### 2. Create a `conda` environment
After miniforge has been successfully installed and `conda` has been activated create a new environment to work in, e.g.:
```bash
conda create -n eobs_r
```
At the time of writing, we focused on python 3.11 for now, but alternative python versions might be supported in the future.

### 3. Install requirements
Finally install all the required libraries, which is a mix of `conda` and pure `R` libraries.
```bash
git clone https://github.com/ECA-D/eobs_environment .
cd eobs_environment
bash create_environment.sh
```
Which first installs the `conda`-packages in `conda_env.txt`. Some packages are not available in `conda-forge`, so they are installed from their respective sources in `install_step1_R.sh`.

#### 4. Install `eobs` from source
This step is currently not available

### 5. Test for a succesfull installation
```bash
bash run_minimal_test.sh
```
