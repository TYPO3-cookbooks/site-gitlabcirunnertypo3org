# Description

Installs, registers and configures Gitlab CI runners.

# Requirements

## Platform:

* debian (> 8.0)

## Cookbooks:

* t3-base (~> 0.2.59)
* site-dockertypo3org (~> 1.0.0)
* t3-chef-vault (~> 1.0.0)
* gitlab-ci-runner (= 1.4.0)

# Attributes

* `node['site-gitlabcirunnertypo3org']['gitlab_url']` - URL of the GitLab server. Defaults to `https://git-t3o.typo3.org`.

# Recipes

* site-gitlabcirunnertypo3org::default

Application Data
----------------

* none


Vaults
------

The following chef-vault entries are read by this cookbook:

* `<gitlab-hostname>-runner:registration_token`, i.e. the `registration_token` entry from the `git-t3otypo3org-runner` vault.


# License and Maintainer

Maintainer:: TYPO3 Association (<steffen.gebert@typo3.org>)

License:: Apache 2.0
