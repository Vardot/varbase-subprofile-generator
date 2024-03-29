#!/bin/usr/env bash

################################################################################
##
## Quick tip on how to use this script command file.
##
## By Bash:
## -----------------------------------------------------------------------------
## bash ./install-needed-tools.sh
##------------------------------------------------------------------------------
##
##
################################################################################

### 1. Install sed
echo '                                            ';
echo '--------------------------------------------';
echo '  Install sed';
echo '--------------------------------------------';
echo '                                            ';
sudo apt install -y sed ;

### 2. Install awk
echo '                                            ';
echo '--------------------------------------------';
echo '  Install gawk';
echo '--------------------------------------------';
echo '                                            ';
sudo apt install -y gawk ;

### 3. Install rename
echo '                                            ';
echo '--------------------------------------------';
echo '  Install rename';
echo '--------------------------------------------';
echo '                                            ';
sudo apt install -y rename ;
