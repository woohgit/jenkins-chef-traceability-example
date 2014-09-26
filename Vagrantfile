
Vagrant.configure("2") do |config|
  # install chef on the system using the omnibus installer
  # this requires the vagrant-omnibus plugin:
  # vagrant plugin install vagrant-omnibus

  config.berkshelf.enabled = true
  config.berkshelf.freeze = false
  config.omnibus.chef_version = :latest
  config.vm.hostname = "cloudbees-chef"
  config.vm.box = "hashicorp/precise64"
  config.chef_zero.enabled = true
  config.chef_zero.chef_repo_path = "."

  config.vm.provision :chef_client do |chef|
  	chef.add_recipe "webinar::default"
  end
end
