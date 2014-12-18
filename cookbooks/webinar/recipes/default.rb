package "make" do
  action :nothing
end.run_action(:install)

chef_gem 'chef-handler-jenkins'

require 'chef/handler/jenkins'

execute "apt-get update" do
	command "apt-get update"
	action :run
end

%w{wget openjdk-7-jdk tomcat7}.each do |p|
	package p
end

# Add our jenkins installation as an endpoint
# this is going to be a callback url
chef_handler 'Chef::Handler::Jenkins' do
  source 'chef/handler/jenkins'
  arguments :url => 'http://10.0.2.2:8080'
  action :enable
end

service "tomcat7" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

file "/var/lib/tomcat7/webapps/traceability.war" do
  action :delete
end

# Grab the traceability.war artifact from our lates jenkins build
remote_file "/var/lib/tomcat7/webapps/traceability.war" do
  action :create
  owner "root"
  group "root"
  mode "0644"
  source "http://10.0.2.2:8080/job/ChefSample/lastSuccessfulBuild/artifact/target/traceability.war"
  notifies :restart, "service[tomcat7]" # restart tomcat when a new traceability war is online
end
