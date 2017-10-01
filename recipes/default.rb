include_recipe 't3-base'

include_recipe 'site-dockertypo3org'

include_recipe 'gitlab-ci-runner'

include_recipe 't3-chef-vault'

name = 'docker'
# token = chef_vault_password('git-t3o.typo3.org', node['fqdn'], 'token')
token = chef_vault_password('git-t3o.typo3.org', 'test', 'token')


template '/etc/gitlab-runner/config.toml' do
  variables(
    name: name,
    url: node['site-gitlabcirunnertypo3org']['gitlab_url'],
    token: token
  )
end

gitlab_ci_runner name do
  options(
    registration_token: token,
    url: node['site-gitlabcirunnertypo3org']['gitlab_url'],
    executor: 'docker'
  )
end
