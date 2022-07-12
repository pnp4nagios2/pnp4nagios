#!/bin/sh
#              _        _           _ _     _       _     
#   __ _ _   _| |_ ___ | |__  _   _(_) | __| |  ___| |__  
#  / _` | | | | __/ _ \| '_ \| | | | | |/ _` | / __| '_ \ 
# | (_| | |_| | || (_) | |_) | |_| | | | (_| |_\__ \ | | |
#  \__,_|\__,_|\__\___/|_.__/ \__,_|_|_|\__,_(_)___/_| |_|
#                                                         
#
# https://git.io/autobuild 
#
# This script performs the initial autotools bootstrapping.
 
# Abort the script and exit with failure if any command below exits with
# a non-zero exit status.
set -e
 
# Create the m4/ directory if it doesn't exist.
[ -d m4 ] || mkdir m4
 
# If there's configure script, reconfigure the autoconf files. Make sure
# to install missing files and re-run configure and make if needed.
#[ -e configure ] || autoreconf -im
#aclocal && automake --gnu --add-missing && autoconf
aclocal && autoconf
 
# If the Makefile doesn't exist, the previous step didn't run; this
# indicates the presence of a configure script. Run that script and
# then call make.
[ -e Makefile ]  || ( ./configure && make )
 
# If src/codename doesn't exist, there was a Makefile but make hasn't
# been run yet. Run it, which should produce the codename binary.
[ -e src/pnpsender.c ] || make
