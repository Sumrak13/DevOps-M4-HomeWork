Vagrant.configure("2") do |config|
	
	config.ssh.insert_key = false

    config.vm.define "jenkins" do |jenkins|	
        jenkins.vm.box="shekeriev/centos-stream-9"
        jenkins.vm.hostname = "jenkins.do1.lab"
        jenkins.vm.network "private_network", ip: "192.168.99.100"
		jenkins.vm.network "forwarded_port", guest: 22, host: 2200, auto_correct: true
		jenkins.vm.network "forwarded_port", guest: 80, host: 8000, auto_correct: true
		jenkins.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
		jenkins.vm.network "forwarded_port", guest: 9070, host: 9070, auto_correct: true
		jenkins.vm.synced_folder "Shared_Data", "/vagrant"
		jenkins.vm.provision "shell", path: "network-setup.sh"
        jenkins.vm.provision "shell", path: "_InstallScripts/others-setup.sh"
        jenkins.vm.provision "shell", path: "_InstallScripts/git-setup.sh"
		jenkins.vm.provision "shell", path: "_InstallScripts/jenkins-setup.sh"
        jenkins.vm.provision "shell", path: "_InstallScripts/docker-setup.sh"
        jenkins.vm.provision "shell", path: "_PostConfig/PostDocker-config.sh"
        jenkins.vm.provision "shell", path: "_PostConfig/PostJenkins-config.sh"
        jenkins.vm.provision "shell", path: "ExitMsg.sh"
		jenkins.vm.provider "virtualbox" do |v|
			v.name = "Jenkins-M4"
            v.memory = 8192
            v.cpus = 4
		end
    end
	
  end
  