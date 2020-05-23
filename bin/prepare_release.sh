#!/bin/sh -x
#	./bin/prepare_release.sh
################################################################################
##	Copyright (C) 2020	  Alejandro Colomar Andrés		      ##
##	Copyright (C) 2020	  Sebastian Francisco Colomar Bauza	      ##
##	SPDX-License-Identifier:  GPL-2.0-only				      ##
################################################################################
##
## Prepare the repo for release
## ============================
##
##  - Remove the files that shouldn't go into the release
##  - Update version numbers
##
################################################################################


################################################################################
##	functions							      ##
################################################################################
update_version()
{
	local	version=$1
	local	old_version=v0.4
	local	template=cloudformation-https.yaml


	local	template_local=./install/AMI/CloudFormation/$template
	sed "/docker_branch=/s/$old_version/v$version/"			\
			-i ./app/README.md				\
			-i ./install/AMI/README.md			\
			-i ./install/docker/README.md			\
			-i ./README.md
	sed "/docker-aws/s/$old_version/v$version/"			\
			-i $template_local
	sed "/old_version/s/$old_version/v$version/"			\
			-i ./bin/prepare_release.sh
}


################################################################################
##	main								      ##
################################################################################
main()
{
	local	version=$1

	update_version	${version}
}


################################################################################
##	run								      ##
################################################################################
main	$1


################################################################################
##	end of file							      ##
################################################################################
