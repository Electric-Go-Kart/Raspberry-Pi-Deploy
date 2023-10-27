#!/bin/bash
# Must be run on a debian based system
# First install the basic packages if not already installed:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install curl
sudo apt-get install git
sudo apt-get install python3-virutalenv
echo "Packages installed"
echo "------------------"
echo "Enter the name of the conda environment you want to create:"
read env_name

virtualenv $env_name

echo "Python virtual environment created"
echo "-------------------------"
echo "To start your environment, run the following command:"
echo "source $env_name/bin/activate"
echo "-------------------------"
echo "To install any other packages, run the following command:"
echo "pip install -r requirements.txt"
echo "-------------------------"

echo "To stop your environment, run the following command:"
echo "conda deactivate/n"