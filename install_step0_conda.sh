#!/bin/bash
echo "==== install python 3.11 ===="
conda install python=3.11.6
echo "==== install conda-forge libraries ===="
conda install --file conda_env.txt -vv
