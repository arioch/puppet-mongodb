# == Class mongodb::preinstall
#
class mongodb::preinstall {
  if $::mongodb::manage_repo {
    $apt_repo_key = '7F0CEB10'

    case $::operatingsystem {
      'RedHat', 'CentOS', 'Scientific', 'OEL', 'Amazon', 'Fedora': {
        #yumrepo { 'repo':
        #  descr    => 'descr',
        #  baseurl  => 'basurl',
        #  gpgkey   => 'gpgkey',
        #  enabled  => 1,
        #  gpgcheck => 1;
        #}
      }

      'Debian', 'Ubuntu': {
        apt::key { $apt_repo_key:
          ensure => present,
          notify => Exec['mongodb apt-get update'],
        }

        if defined('::apt::source') {
          # Puppetlabs/apt module
          apt::source { '10gen':
            location    => 'http://downloads-distro.mongodb.org/repo/debian-sysvinit',
            release     => 'dist',
            repos       => '10gen',
            include_src => false,
            key         => $apt_repo_key,
          }
        }

        if defined('::apt::sources_list') {
          # Camp2Camp/apt module
          apt::sources_list { '10gen':
            ensure  => present,
            source  => false,
            content => 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen',
            notify  => Exec['apt-get update'],
            require => Apt::Key[$apt_repo_key],
          }
        }

        exec { 'mongodb apt-get update':
          command     => 'apt-get update',
          path        => '/usr/bin',
          refreshonly => true,
        }
      }

      default: {
        fail "Operating system ${::operatingsystem} is not supported yet."
      }
    }
  }
}

