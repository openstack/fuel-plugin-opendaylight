class opendaylight::quagga (
){
  package { ['opnfv-quagga', 'libcapnp-0.5.99', 'python-pycapnp', 'python-thriftpy']:
     ensure => installed,
  }
  service {'opnfv-quagga':
    ensure => running
  }

  $config_path  = /usr/lib/quagga/qthrift/bgpd.conf
  ini_setting { 'bgp_password':
    ensure  => present,
    setting => 'password',
    value   => 'sdncbgpc',
    path    => $config_path,
    require => Package['opnfv-quagga']
    notify => Service['opnfv-quagga']
  }
}
