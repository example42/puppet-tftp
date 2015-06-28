# Puppet module: tftp

## DEPRECATION NOTICE
This module is no more actively maintained and will hardly be updated.

Please find an alternative module from other authors or consider [Tiny Puppet](https://github.com/example42/puppet-tp) as replacement.

If you want to maintain this module, contact [Alessandro Franceschi](https://github.com/alvagante)


This is a Puppet tftp module from the second generation of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-tftp

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module.

For detailed info about the logic and usage patterns of Example42 modules read README.usage on Example42 main modules set.

## USAGE - Basic management

* Install tftp with default settings

        class { "tftp": }

* Start tftp as service (default startup mode is xinetd)

        class { 'tftp':
          startup_mode => 'standalone',
        }

* Disable tftp service. (Only used with a standalone startup mode)

        class { "tftp":
          startup_mode => 'standalone',
          disable      => true
        }

* Disable tftp service at boot time, but don't stop if is running. (Only used with a standalone startup mode)

        class { "tftp":
          startup_mode => 'standalone',
          disableboot  => true
        }

* Remove tftp package

        class { "tftp":
          absent => true
        }

* Enable auditing without without making changes on existing tftp configuration files

        class { "tftp":
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { "tftp":
          source => [ "puppet:///modules/lab42/tftp/tftp.conf-${hostname}" , "puppet:///modules/lab42/tftp/tftp.conf" ],
        }


* Use custom source directory for the whole configuration dir

        class { "tftp":
          source_dir       => "puppet:///modules/lab42/tftp/conf/",
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file

        class { "tftp":
          template => "example42/tftp/tftp.conf.erb",
        }

* Use custom template for init script file. (Only used with a standalone startup mode)

        class { 'tftp':
          startup_mode       => 'standalone',
          file_init_template => 'example42/tftp/tftp-init.conf.erb',
        }

* Define custom options that can be used in a custom template without the
  need to add parameters to the tftp class

        class { "tftp":
          template => "example42/tftp/tftp.conf.erb",
          options  => {
            'LogLevel' => 'INFO',
            'UsePAM'   => 'yes',
          },
        }

* Automaticallly include a custom subclass

        class { "tftp:"
          my_class => 'tftp::example42',
        }


## USAGE - Example42 extensions management
* Activate puppi (recommended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { "tftp":
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with
  a puppi::helper define ) to customize the output of puppi commands

        class { "tftp":
          puppi        => true,
          puppi_helper => "myhelper",
        }

* Activate automatic monitoring (recommended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { "tftp":
          monitor      => true,
          monitor_tool => [ "nagios" , "monit" , "munin" ],
        }

* Activate automatic firewalling
  This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { "tftp":
          firewall      => true,
          firewall_tool => "iptables",
          firewall_src  => "10.42.0.0/24",
          firewall_dst  => "$ipaddress_eth0",
        }


[![Build Status](https://travis-ci.org/example42/puppet-tftp.png?branch=master)](https://travis-ci.org/example42/puppet-tftp)
