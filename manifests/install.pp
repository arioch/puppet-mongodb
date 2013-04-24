# = Class mongodb::install
#
class mongodb::install {
  package { $::mongodb::pkg_list:
    ensure => $::mongodb::pkg_ensure,
  }

  if $::mongodb::pkg_deps {
    package { $::mongodb::pkg_deps:
      ensure => $::mongodb::pkg_ensure,
      before => Package[$::mongodb::pkg_list],
    }
  }
}

