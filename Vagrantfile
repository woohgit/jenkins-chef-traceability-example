Vagrant.configure("2") do |config|

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.vm.hostname = "cloudbees-chef"
  config.vm.box = "hashicorp/precise64"
  config.chef_zero.enabled = true
  config.chef_zero.chef_repo_path = "."
  config.vm.network :forwarded_port, host: 8808, guest: 8080

  config.vm.provision :chef_client do |chef|
  	chef.add_recipe "webinar::default"
  end
end
