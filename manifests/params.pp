# = Class mongodb::params
#
class mongodb::params {
  $manage_repo = false

  $authentication = false
  $db_path        = '/var/lib/mongodb'
  $listen_port    = '27017'
  $log_append     = true
  $no_journal     = false
  $quota          = false

  case $::operatingsystem {
    'RedHat': {
      $config_dir         = undef
      $config_file        = undef
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_group       = 'root'
      $config_mode        = '0644'
      $config_purge       = false
      $config_user        = 'root'
      $daemon_group       = undef
      $daemon_user        = undef
      $log_dir            = undef
      $pid_file           = undef
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = undef
      $service_hasstatus  = undef
      $service_name       = undef
    }

    'Debian': {
      $config_file        = '/etc/mongodb.conf'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'mongodb'
      $daemon_user        = 'mongodb'
      $log_dir            = '/var/log/mongodb'
      $pid_file           = '/var/run/mongodb.pid'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'mongodb-10gen'
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_name       = 'mongodb'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }
}

