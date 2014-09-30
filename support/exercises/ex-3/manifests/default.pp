$packages = ['tmux', 'git']
package { $packages:
  ensure => latest,
}

package { 'apache2':
  ensure  => latest,
  require => Package['tmux'],
}

file { '/root/puppet.txt':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0660',
  content => "Vagrant ran Puppet\n",
}

