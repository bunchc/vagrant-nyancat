nodes = {
    'nyan'   => [1, 210],
}

Vagrant.configure("2") do |config|
    # Uncomment one of these. Dummy for the Rackspace provider, precise for vBox or Fusion
    #config.vm.box = "dummy"
    config.vm.box = "precise64"

    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|
            hostname = "%s-%02d" % [prefix, (i+1)]

            config.vm.define "#{hostname}" do |box|
                box.vm.hostname = "#{hostname}.book"
                box.vm.network :private_network, ip: "172.16.172.#{ip_start+i}", :netmask => "255.255.255.0"
                box.vm.provision :shell, :path => "#{prefix}.sh"

                config.vm.provider :rackspace do |rs|
        	    rs.username = "user"
                    rs.api_key  = "key"                    
		    rs.flavor   = /512MB/
                    rs.image    = /Ubuntu 12.04/
                end
                
                # If using Fusion
                box.vm.provider :vmware_fusion do |v|
                    v.vmx["memsize"] = 256
                end
                box.vm.provider :virtualbox do |vbox|
                    vbox.customize ["modifyvm", :id, "--memory", 256]
                end
            end
        end
    end
end


