Exercise 1: User-data
=====================

OpenStack supports a `--user-data` flag when booting an instance on the command line. The OpenStack Dashboard also exposes this option as a text box.

The `--user-data` flag directly corresponds to the `cloud-init` feature.

`cloud-init` is a set of scripts and utilities that help virtual machines boot in a cloud environment. More information about `cloud-init` can be found [here](https://help.ubuntu.com/community/CloudInit).

As an example, examine the contents of ex1.sh. This is a simple bash script that will accomplish a few tasks:

1. Configure the server to use a central apt-cache service
2. Run `apt-get update` to update the apt package repository.
3. Install some general packages such as git and tmux
4. Install the Apache web server

To use this script at boot time, boot an instance in OpenStack using the following commands:

    cd ~/exercises/ex-1
    source ~/rc/adass-openrc-<region>.sh
    nova boot --flavor 1 --image "Ubuntu 14.04" --key-name adass --user-data ex1.sh <your-name>

You can check the status of the creation by doing both:

    nova show <your name>
    nova console-log <your name>

When the instance has reached a command-prompt, you can log in with:

    ssh ubuntu@<ip address>

When you are done with this exercise, delete your instance by doing:

    nova delete <your name>
