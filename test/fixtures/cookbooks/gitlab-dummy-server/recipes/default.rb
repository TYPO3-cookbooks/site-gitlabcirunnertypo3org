include_recipe 'nginx'

cookbook_file '/etc/nginx/conf.d/default.conf' do
  source 'nginx-default.conf'
  notifies :restart, 'service[nginx]', :immediately
end
