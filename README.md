# Chef Tracking Plugin for Jenkins

The purpose of this repository is the demonstration of the Chef Tracking Plugin for jenkins by [CloudBees](http://www.cloudbees.com) the Enterprise Jenkins Company 


### Jenkins preparation
For prepairing the jenkins environment, you have to do the following:

1. Download a latest jenkins from [jenkins-ci.org](http://jenkins-ci.org).

2. Install [Chef Tracking Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Chef+Tracking+Plugin)
3. Install [Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin) (required for the ChefSample job)
4. Using the jenkins-cli create and enable the ChefSample job using the config.xml seed


Get the jenkins cli, create and enable the jobs by:

	$ ./get_cli.sh
	$ ./create_jobs.sh

When you're ready with the job creation, just schedule (start) the job once. This will create an artifact which is going to be used by our chef cookbook.

### Chef preparation

You'll need [VirtualBox](https://www.virtualbox.org/wiki/Downloads), [Vagrant](https://www.vagrantup.com/downloads.html) and [Chef Development Kit](http://downloads.getchef.com/chef-dk/) to be installed on your system. Additionally you need to install a few vagrant plugins:

	$ vagrant plugin install vagrant-chef-zero
    $ vagrant plugin install vagrant-omnibus
    $ vagrant plugin install vagrant-berkshelf
    $ vagrant plugin install vagrant-triggers

When you're ready with the preparation, you can fire up a chef server and a client using the following commands in the root of the repository:

	$ berks install
    $ vagrant up

This command will:

1. start up a local chef-zero chef server
2. download an ubuntu-precise image
3. resolve and download the cookbook dependencies (using the berkself plugin)
4. upload the cookbooks to the chef-server (using the chef-zero pugin)
5. start a virtual ubuntu server and install chef on it (using the omnibus plugin)
6. start chef-client on the server :)

In case if you want to re-run chef-client, you only have to run:

	$ vagrant provision
    
### What should I see?

The chef run is going to grab the latest artifact built by the ChefSample job, and place that file on your virtual ubuntu server. The chef-handler-jenkins submits information about what chef has deployed. It monitors chef's activities and find out which files have been updated.

When you go back to your jenkins build and check your artifact's fingerprint, you'll see new information about when and where was your tracked artifact deployed.

![Image of the tracked artifact](http://www.wooh.hu/chef_tracking_plugin.png)

### External links

- [Chef Handler Jenkins](https://github.com/jenkinsci/chef-handler-jenkins/): chef exception and report handler
- [Berkshelf](http://berkshelf.com/)
- [chef-zero](https://github.com/opscode/chef-zero)
- [vagrant-omnibus](https://github.com/opscode/vagrant-omnibus)
