include_recipe 'nginx'

cookbook_file '/etc/nginx/sites-available/default' do
  source 'nginx-default.conf'
  notifies :restart, 'service[nginx]', :immediately
end
