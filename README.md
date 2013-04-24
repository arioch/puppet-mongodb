# Puppet MongoDB

## Requirements

* Puppetlabs [apt module](https://github.com/puppetlabs/puppetlabs-apt) or
* Camptocamp [apt module](https://github.com/camptocamp/puppet-apt)

## Example usage

### Install MongoDB

    node /box/ {
      include mongodb
    }

### Manage repository

    node /box/ {
      class {
        'mongodb': manage_repo => true;
      }
    }

