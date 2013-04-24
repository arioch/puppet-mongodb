# = Class mongodb
#
class mongodb::service {
  service { $::mongodb::service_name:
    ensure    => $::mongodb::service_ensure,
    enable    => $::mongodb::service_enable,
    hasstatus => $::mongodb::service_hasstatus,
    require   => Class['::mongodb::config'];
  }
}

