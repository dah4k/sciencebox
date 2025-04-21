# Copyright 2025 dah4k
# SPDX-License-Identifier: EPL-2.0

## Override host environment variables for guest SSH session
ENV["TERM"] = "xterm"

Vagrant.configure("2") do |config|
    ## Vagrant Provider
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.linked_clone = true
        vb.memory = 4092
        vb.cpus = 2
    end

    ## Disable default sharing current directory
    config.vm.synced_folder ".", "/vagrant", disabled: true

    ## Centos 6.10 **END-OF-LIFE**
    ## https://portal.cloud.hashicorp.com/vagrant/discover/generic/centos6
    config.vm.define "centos", autostart: false do |centos|
      centos.vm.box = "generic/centos6"
      centos.vm.box_version = "4.3.12"
      centos.vm.hostname = "centos"

      # HACK: File provision "SCP as User" and cannot write directly to /etc
      centos.vm.provision "Purge /etc/yum.repos.d/*", type: "shell",
          inline: "rm --force /etc/yum.repos.d/*.repo"
      centos.vm.provision "Upload Centos-Vault.repo to /tmp", type: "file",
          source: "files/CentOS-Vault.repo",
          destination: "/tmp/CentOS-Vault.repo"
      centos.vm.provision "Move /tmp/CentOS-Vault.repo", type: "shell",
          inline: <<-SHELL
              chown root:root /tmp/CentOS-Vault.repo
              chmod 0664 /tmp/CentOS-Vault.repo
              mv /tmp/CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo
          SHELL
    end

    ## Ubuntu 22.04 (Jammy Jellyfish)
    ## https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-22.04
    config.vm.define "test", primary: true do |ubuntu|
      ubuntu.vm.box = "bento/ubuntu-22.04"
      ubuntu.vm.box_version = "202502.21.0"
      ubuntu.vm.hostname = "test"

      ubuntu.vm.provision "ansible" do |ansible|
        ansible.playbook = "files/create-users-playbook.yml"
        ansible.playbook = "files/add-yolo-playbook.yml"
      end
    end

    ## Debian 12
    ## https://portal.cloud.hashicorp.com/vagrant/discover/debian/bookworm64
    config.vm.define "debian", autostart: false do |debian|
      debian.vm.box = "debian/bookworm64"
      debian.vm.box_version = "12.20250126.1"
      debian.vm.hostname = "debian"
    end

    ## openSUSE Leap 15.6
    ## https://portal.cloud.hashicorp.com/vagrant/discover/bento/opensuse-leap-15.6
    config.vm.define "opensuse", autostart: false do |opensuse|
      opensuse.vm.box = "bento/opensuse-leap-15.6"
      opensuse.vm.box_version = "202502.21.0"
      opensuse.vm.hostname = "opensuse"

      opensuse.vm.provision "shell", path: "files/opensuse_install_devtools.sh"
      opensuse.vm.provision "shell", path: "files/opensuse_install_bpf_devel.sh"
      opensuse.vm.provision "shell", path: "files/opensuse_build_capa.sh", privileged: false
      opensuse.vm.provision "shell", path: "files/opensuse_build_asciinema.sh", privileged: false
    end

    ## OPNsense on FreeBSD 14.2
    ## https://portal.cloud.hashicorp.com/vagrant/discover/bento/freebsd-14.2
    config.vm.define "opnsense", autostart: false do |opnsense|
      opnsense.vm.box = "bento/freebsd-14.2"
      opnsense.vm.box_version = "202502.21.0"
      opnsense.vm.hostname = "opnsense"

      # TODO: https://github.com/opnsense/update/tree/master?tab=readme-ov-file#opnsense-bootstrap
    end
end
