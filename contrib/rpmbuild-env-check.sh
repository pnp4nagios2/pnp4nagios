#!/bin/sh
# This script performs checks on rpmbuild environment setup
 
# Abort the script and exit with failure if any command below exits with
# a non-zero exit status.
set -e
 
[ -e /usr/bin/autoconf ] || (echo "sudo dnf install -y autoconf")
[ -e /usr/bin/automake ] || (echo "sudo dnf install -y automake")
[ -e /usr/bin/gcc      ] || (echo "sudo dnf install -y rpmbuild")
#echo $?
