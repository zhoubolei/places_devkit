#!/bin/bash
echo "Downloading data split for Places365-Standard"
wget http://data.csail.mit.edu/places/places365/filelist_places365-standard.tar
tar -xvf filelist_places365-standard.tar

echo "Downloading data split for Places365-Challenge"
wget http://data.csail.mit.edu/places/places365/filelist_places365-challenge.tar
tar -xvf filelist_places365-challenge.tar
