# == Class mongodb::config
#
class mongodb::config {
  File {
    require => Class['::mongodb::install'],
    notify  => Service[$::mongodb::service_name],
    owner   => $::mongodb::config_user,
    group   => $::mongodb::config_group,
    mode    => $::mongodb::config_file_mode,
  }

  file {
    $::mongodb::config_file:
      ensure  => present,
      content => template('mongodb/mongodb.conf.erb');

    $::mongodb::log_dir:
      ensure => directory,
      owner  => $::mongodb::daemon_user,
      group  => $::mongodb::daemon_group;
  }
}

