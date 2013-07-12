# Class: tftp::params
#
# This class defines default parameters used by the main module class tftp
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to tftp class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class tftp::params {

  # Template for init file
  $file_init_template = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'tftp/init-debian.erb',
    default                   => '',
  }

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/                          => 'tftpd-hpa',
    /(?i:RedHat|Centos|Scientific|Fedora|OracleLinux)/ => 'tftp-server',
    default                                            => 'tftpd',
  }

  $service = $::operatingsystem ? {
    /(?:Ubuntu|Debian|Mint)/ => 'tftpd-hpa',
    default                  => 'tftpd',
  }

  $service_hasstatus = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'in.tftpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/xinetd.d/tftp',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/tftpd-hpa',
    default                   => '/etc/sysconfig/tftpd',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/tftpd-hpa.pid',
    default                   => '/var/run/tftpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/              => '/srv/tftp',
    /(?i:RedHat|Centos|Scientific|Fedora)/ => '/tftproot',
    default                                => '/tftproot',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/              => '/var/log/syslog',
    default                                => '/var/log/messages',
  }

  $port = '69'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $template = 'tftp/xinetd.tftp.erb'
  $options = ''
  $service_autorestart = true
  $absent = false
  $disable = false
  $disableboot = false
  $startup_mode = 'xinetd'

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
