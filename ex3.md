Exercise 3: Vagrant
===================

[Vagrant](http://www.vagrantup.com/) is an extremely robust and flexible tool that can be used to manage all sorts of virtual machines. By default, Vagrant supports [VirtualBox](https://www.virtualbox.org/), but there are several additional plugins available to make Vagrant work with other Hypervisors. These plugins are called `providers`.

In addition to launching virtual machines on a wide array of hypervisors, Vagrant can also provision the virtual machines using various means. By default, Vagrant supports Shell, Puppet, Ansible, Chef, Salt, Docker, and CFEngine as provisioners. As well, several community provisioner plugins exist.

This exercise will highlight Vagrant's ability to launch an instance inside OpenStack and then configure it using two different provisioners: shell and puppet. In addition, the [Serverspec](http://serverspec.org/) plugin will also be used to highlight an advanced way of verifying the instance's functionality.

Examine the contents of `Vagrantfile`, `vagrant-shell.sh`, `manifests/default.pp`, and `spec/example_spec.rb` to see everything being done in this exercise.

To launch the instance using Vagrant, run the following commands:

    cd ~/exercises/ex-3
    source ~/rc/adass-openrc-<region>.sh
    vagrant up --provider openstack <your name>

You can see the status of the instance's launch and its provisioning status in real-time from the Vagrant output. When Vagrant has finished, you can log in to your instance by running:

    vagrant ssh <your name>

When you are done with this exercise, you can delete your instance by running:

    vagrant destroy <your name>
