#!/bin/bash

# we override the artifact_id variable; the tests in (test_template.py) depend on this value, so be careful when you change it
# we also create a portlet with both openbis and access to qbic databases

# create all projects (just four, for now... maybe later we need to do this using for loops)
rm -Rf template-test && cookiecutter --no-input . artifact_id=template-test use_openbis=no use_qbic_databases=no && pytest --cov=./ && mvn -X -e --file template-test/pom.xml --settings template-test/.travis.settings.xml cobertura:cobertura
rm -Rf template-test && cookiecutter --no-input . artifact_id=template-test use_openbis=no use_qbic_databases=yes && pytest --cov=./ && mvn -X -e --file template-test/pom.xml --settings template-test/.travis.settings.xml cobertura:cobertura
rm -Rf template-test && cookiecutter --no-input . artifact_id=template-test use_openbis=yes use_qbic_databases=no && pytest --cov=./ && mvn -X -e --file template-test/pom.xml --settings template-test/.travis.settings.xml cobertura:cobertura
rm -Rf template-test && cookiecutter --no-input . artifact_id=template-test use_openbis=yes use_qbic_databases=yes && pytest --cov=./ && mvn -X -e --file template-test/pom.xml --settings template-test/.travis.settings.xml cobertura:cobertura
