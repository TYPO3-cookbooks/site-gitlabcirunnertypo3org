name             "site-gitlabcirunnertypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Gitlab CI Runner with Docker"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

supports         "debian",     "> 8.0"

depends          "t3-base",    "~> 0.2.59"

depends          "site-dockertypo3org", "~> 1.0.0"
depends          "t3-chef-vault",       "~> 1.0.0"

depends          "gitlab-ci-runner", "= 1.4.0"
