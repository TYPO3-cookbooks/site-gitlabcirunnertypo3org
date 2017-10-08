# needed for parsing the config file
chef_gem 'toml'
require 'toml'
require 'uri'

include_recipe 't3-base'
include_recipe 'site-dockertypo3org'
include_recipe 'gitlab-ci-runner'
include_recipe 't3-chef-vault'

gitlab_host = URI(node['site-gitlabcirunnertypo3org']['gitlab_url']).host
registration_token = chef_vault_password(gitlab_host, 'runner', 'registration_token')

# this registers the runner at the gitlab server using the registration_token and writes
# some information to the config file, including an auto-generated token (NOT matching the
# registration_token)
name = "#{node['fqdn']}-docker"
gitlab_ci_runner name do
  options(
    registration_token: registration_token,
    url: node['site-gitlabcirunnertypo3org']['gitlab_url'],
    executor: 'docker',
    :'docker-image' => 'docker:1',
    :'tag-list' => ['docker']
  )
end

# replace config file with our parameters
template '/etc/gitlab-runner/config.toml' do
  variables lazy {
    # we don't know the token, so read it from the file on disk before replacing it
    config_on_disk = TOML.load_file('/etc/gitlab-runner/config.toml')
    {
      name: name,
      url: node['site-gitlabcirunnertypo3org']['gitlab_url'],
      token: config_on_disk['runners'].first['token']
    }
  }
  notifies :restart, 'service[gitlab-runner]'
end

service 'gitlab-runner'
