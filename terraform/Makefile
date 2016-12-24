.DEFAULT_GOAL := help
.PHONY: help plan apply deps destroy graph refresh show_pl show_st

# --- default SHELL for make for consistency on different platforms
SHELL := /bin/bash

# --- make a variable to enable the testing of different versions.
TERRAFORM = terraform

help:
	@echo "Wrapper around terraform for specific project"
	@echo ""
	@echo "Targets:"
	@echo "  apply     Commits the plan against the infrastructure"
	@echo "  deps      Ensures system requirements are met"
	@echo "  help      This message"
	@echo "  plan      Builds a new Terraform plan file"
	@echo "  destroy   Removes the infrastructure"
	@echo "  graph     Builds a graph of the infrastructure"
	@echo "  refresh   Reconcile local state with real world"
	@echo "  show_pl   Provide human readible output from plan file"
	@echo "  show_st   Provide human readible output from state file"
	@echo ""

deps:
	@hash $(TERRAFORM) > /dev/null 2>&1 || \
		(echo "Install terraform to continue"; exit 1)
	@test -n "$(AWS_ACCOUNT)" || \
		(echo "AWS_ACCOUNT env not set"; exit 1)
	@test -n "$(AWS_ACCESS_KEY_ID)" || \
		(echo "AWS_ACCESS_KEY_ID env not set"; exit 1)
	@test -n "$(AWS_SECRET_ACCESS_KEY)" || \
		(echo "AWS_SECRET_ACCESS_KEY env not set"; exit 1)
	@test -n "$(AWS_REGION)" || \
		(echo "AWS_REGION env not set"; exit 1)

plan: deps
	$(TERRAFORM) plan \
		-var="aws_access_key=$(AWS_ACCESS_KEY_ID)" \
		-var="aws_secret_key=$(AWS_SECRET_ACCESS_KEY)" \
		-var="aws_account=$(AWS_ACCOUNT)" \
		-var="aws_region=$(AWS_REGION)" \
		-state="$(AWS_ACCOUNT)-$(AWS_REGION).tfstate" \
		-out="$(AWS_ACCOUNT)-$(AWS_REGION).tfplan"

graph: deps
	mkdir -p  ./graphs && \
	$(TERRAFORM) graph -draw-cycles | dot -Tpng > ./graphs/"$(AWS_ACCOUNT)-$(AWS_REGION)".`date +"%Y-%m-%d-%T"`.png

apply: deps
	$(TERRAFORM) apply \
		-var="aws_access_key=$(AWS_ACCESS_KEY_ID)" \
		-var="aws_secret_key=$(AWS_SECRET_ACCESS_KEY)" \
		-var="aws_account=$(AWS_ACCOUNT)" \
		-var="aws_region=$(AWS_REGION)" \
		-state="$(AWS_ACCOUNT)-$(AWS_REGION).tfstate"

destroy: deps
	$(TERRAFORM) destroy \
		-var="aws_access_key=$(AWS_ACCESS_KEY_ID)" \
		-var="aws_secret_key=$(AWS_SECRET_ACCESS_KEY)" \
		-var="aws_account=$(AWS_ACCOUNT)" \
		-var="aws_region=$(AWS_REGION)" \
		-state="$(AWS_ACCOUNT)-$(AWS_REGION).tfstate"

refresh: deps
	$(TERRAFORM) refresh \
		-var="aws_access_key=$(AWS_ACCESS_KEY_ID)" \
		-var="aws_secret_key=$(AWS_SECRET_ACCESS_KEY)" \
		-var="aws_account=$(AWS_ACCOUNT)" \
		-var="aws_region=$(AWS_REGION)" \
		-state="$(AWS_ACCOUNT)-$(AWS_REGION).tfstate"

show_pl: deps
	$(TERRAFORM) show "$(AWS_ACCOUNT)-$(AWS_REGION).tfplan"

show_st: deps
	$(TERRAFORM) show "$(AWS_ACCOUNT)-$(AWS_REGION).tfstate"
