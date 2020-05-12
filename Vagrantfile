Vagrant.require_version ">= 1.9.0"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.ssh.insert_key = false

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "local.yml"
    ansible.galaxy_role_file = "requirements.yml"
  end
end
