# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box        = 'precise32'
  config.vm.box_url    = 'http://files.vagrantup.com/precise32.box'
  config.ssh.timeout   = 20
  config.ssh.max_tries = 5

  # config.vm.boot_mode = :gui

  # config.vm.network :hostonly, "192.168.33.10"
  # config.vm.network :bridged
  # config.vm.forward_port 80, 8080

  config.vm.provision :chef_solo do |chef|
    # chef.cookbooks_path = ['..', './tmp/cookbooks']
    chef.run_list       = %w|apt cartodb|
    chef.log_level      = :debug

    chef.json = {
      :gis => {
        :ubuntugis => {
          :repo => 'unstable',
          :packages => %w|gdal-bin libgdal1-dev python-gdal libgdal-ruby libgeos-dev proj-bin libproj-dev postgis|
        }
      }
    }
  end
end
