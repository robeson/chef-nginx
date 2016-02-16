#
# Cookbook Name:: tech_quiz
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# define path variables (could vary depending on NGINX installation and/or preference)
web_config_path = '/etc/nginx/conf.d/tech_quiz.conf'
web_root = '/var/www/tech_quiz'

# install Git
package 'git'

# install NGINX
package 'nginx'

# enable & start NGINX
service 'nginx' do
	action [:enable, :start]
end

# configure NGINX
template web_config_path do
	action :create
	source 'tech_quiz.conf.erb'
	variables({
		:web_root => web_root,
	})
end

# create web root directory, if necessary
directory web_root do
  action :create
  recursive true
end

# checkout site source to web root directory
git web_root do
	repository 'https://github.com/nwea-techops/tech_quiz.git'
	revision 'master'
	action :sync
end

# restart NGINX to apply changes
service 'nginx' do
	action [:restart]
end
