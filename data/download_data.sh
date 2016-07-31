#!/bin/bash
echo "Downloading data split for Places365-Standard"
wget http://places2.csail.mit.edu/challenge2016/filelist_places365-standard.tar
tar -xvf filelist_places365-standard.tar

echo "Downloading data split for Places365-Challenge"
wget http://places2.csail.mit.edu/challenge2016/filelist_places365-challenge.tar
tar -xvf filelist_places365-challenge.tar
