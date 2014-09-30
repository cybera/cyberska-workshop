Exercise 2: config-drive
========================

While `cloud-init` is available on many cloud platforms including OpenStack and AWS, OpenStack has a unique feature called [config-drive](http://docs.openstack.org/user-guide/content/enable_config_drive.html).

As an example of `config-drive`'s use, this exercise will copy over some local files to the remote instance at boot time.

Examine the contents of `ex2-user-data.sh`. This is another `user-data` script. It has been modified from the last exercise in that it just calls a secondary script.

Examine the contents of `ex2-config-drive.sh`. This new script does the steps that `ex1.sh` did previously.

Boot a new OpenStack instance with the following commands:

    cd ~/exercises/ex-2
    source ~/rc/adass-openrc-<region>.sh
    nova boot --flavor 1 --image "Ubuntu 14.04" --key-name adass --user-data ex2-user-data.sh --config-drive true --file /root/ex2-config-drive.sh=ex2-config-drive.sh <your name>

These commands will launch a new instance that will call the `ex2-user-data.sh` script at boot time. The `ex2-user-data.sh` script calls `ex2-config-drive.sh` which is copied over by the `config-drive` feature.

You can check the status of the creation by doing both:

    nova show <your name>
    nova console-log <your name>

When the instance has reached a command-prompt, you can log in with:

    ssh ubuntu@<ip address>

When you are done with this exercise, delete your instance by doing:

    nova delete <your name>
