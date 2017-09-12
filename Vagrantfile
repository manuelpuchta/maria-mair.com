Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "development.maria-mair.com"
  config.vm.network :private_network, :ip => "192.168.50.5"
  config.hostsupdater.remove_on_suspend = true

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "config/provision/puppet/manifests"
    puppet.module_path = "config/provision/puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options="--verbose --debug"
  end

  config.vm.provision :shell, path: "config/provision/shell/local-setup.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  config.trigger.before :destroy do
    info "Run database backup script before destroying the VM."
    run_remote  "bash /vagrant/config/provision/shell/mysqldump.sh"
  end
end
