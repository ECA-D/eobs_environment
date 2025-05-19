print('Start')
library(raster)
library(yaml)
library(doSNOW)
library(RSQLite)
library(Rmpi)
library(snow)
library(doMPI)
library(gstat)
library(sp)

# Imports for eobs
import(LatticeKrig)
import(data.table)
import(fields)
import(foreach)
import(methods)
import(rts)
import(sp)

# Todo activate
# library(eobs)

sessionInfo()
