.PHONY: all plan apply 
SHELL := $(SHELL) -e

all: plan apply

plan:
	terraform get -update
	terraform plan  -out terraform.tfplan

apply:
	terraform apply




