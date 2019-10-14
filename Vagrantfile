Vagrant.configure("2") do |config|
  
  # MySQL Cluster dengan 3 node
  (5..7).each do |i|
    config.vm.define "db#{i}" do |node|
      node.vm.hostname = "db#{i}"
      node.vm.box = "bento/ubuntu-16.04"
      node.vm.network "private_network", ip: "192.168.16.18#{i}"

      # Opsional. Edit sesuai dengan nama network adapter di komputer
      #node.vm.network "public_network", bridge: "Qualcomm Atheros QCA9377 Wireless Network Adapter"
      
      node.vm.provider "virtualbox" do |vb|
        vb.name = "db18#{i}"
        vb.gui = false
        vb.memory = "512"
      end
  
      node.vm.provision "shell", path: "deployMySQL18#{i}.sh", privileged: false
    end
  end

  config.vm.define "webserver" do |webserver|
    webserver.vm.hostname = "webserver"
    webserver.vm.box = "ubuntu/xenial64"
    webserver.vm.network "private_network", ip: "192.168.16.188"

    # Opsional. Edit sesuai dengan nama network adapter di komputer
    #node.vm.network "public_network", bridge: "Qualcomm Atheros QCA9377 Wireless Network Adapter"
    
    webserver.vm.provider "virtualbox" do |vb|
      vb.name = "webserver"
      vb.gui = false
      vb.memory = "1024"
    end

    webserver.vm.provision "shell", path: "deployWebServer.sh", privileged: false
  end

  config.vm.define "proxy" do |proxy|
    proxy.vm.hostname = "proxy"
    proxy.vm.box = "bento/ubuntu-16.04"
    proxy.vm.network "private_network", ip: "192.168.16.184"
    #proxy.vm.network "public_network",  bridge: "Qualcomm Atheros QCA9377 Wireless Network Adapter"
    
    proxy.vm.provider "virtualbox" do |vb|
      vb.name = "proxy"
      vb.gui = false
      vb.memory = "512"
    end

    proxy.vm.provision "shell", path: "deployProxySQL.sh", privileged: false
  end

end
