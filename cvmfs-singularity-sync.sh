#!/bin/bash

dir=/cvmfs/eic.opensciencegrid.org/singularity/athena
rel=/cvmfs/eic.opensciencegrid.org/singularity/CVMFSRELEASE

# Check for release in progress
if [ -f $rel ] ; then
  echo "Release of $dir in progress! Aborting."
  exit -1
fi

# Download all images in images.txt
cat $(dirname $0)/images.txt | while read name url ; do
  wget -q -O "$dir/$name" "$url"
done

touch $rel
