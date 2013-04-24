# = Class mongodb
#
class mongodb (
  $config_dir         = $::mongodb::params::config_dir,
  $config_dir_mode    = $::mongodb::params::config_dir_mode,
  $config_dir_recurse = $::mongodb::params::config_dir_recurse,
  $config_file_mode   = $::mongodb::params::config_file_mode,
  $config_group       = $::mongodb::params::config_group,
  $config_purge       = $::mongodb::params::config_purge,
  $config_user        = $::mongodb::params::config_user,
  $daemon_group       = $::mongodb::params::daemon_group,
  $daemon_user        = $::mongodb::params::daemon_user,
  $log_dir            = $::mongodb::params::log_dir,
  $manage_repo        = $::mongodb::params::manage_repo,
  $pid_file           = $::mongodb::params::pid_file,
  $pkg_deps           = $::mongodb::params::pkg_deps,
  $pkg_ensure         = $::mongodb::params::pkg_ensure,
  $pkg_list           = $::mongodb::params::pkg_list,
  $service_enable     = $::mongodb::params::service_enable,
  $service_ensure     = $::mongodb::params::service_ensure,
  $service_hasrestart = $::mongodb::params::service_hasrestart,
  $service_hasstatus  = $::mongodb::params::service_hasstatus,
  $service_name       = $::mongodb::params::service_name,
) inherits mongodb::params {
  class { 'mongodb::preinstall': } ->
  class { 'mongodb::install': } ->
  class { 'mongodb::config': } ~>
  class { 'mongodb::service': } ->
  Class['mongodb']
}

