.DEFAULT_GOAL := help
#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BUCKET = [OPTIONAL] your-bucket-for-syncing-data (do not include 's3://')
PROFILE = default
PROJECT_NAME = dga_predict
PYTHON_INTERPRETER = python3
CONFIG_FILE = $(PROJECT_DIR)/config

#################################################################################
# COMMANDS                                                                      #
#################################################################################
creenv:
	conda create --name $(PROJECT_NAME) python=3

actenv:
	@echo RUN: source activate $(PROJECT_NAME)

clean:
	@rm traindata.pkl traindata.png log lstm.h5 bigram.h5 

testenv:
	@echo TODO
	#$(PYTHON_INTERPRETER) test_environment.py

req:
	conda install -c conda-forge --file=requirements.txt
	
sync_data_to_s3:
	@echo TODO

sync_data_from_s3:
	@echo TODO

train:
	$(PYTHON_INTERPRETER) run.py &> log

pred: 
	@echo TODO

test: 
	@echo TODO

lint:
	@echo TODO

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

help:
	@echo creenv actenv clean testenv req sync_data_to_s3 sync_data_from_s3 train pred test lint help

