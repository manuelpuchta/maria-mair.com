# Install PHP

class php5::install {

	package { [
		  'php5',
		  'php5-mysql',
		  'php5-curl',
		  'php5-cli',
		  'php5-gd',
		  'php5-fpm',
		  'libapache2-mod-php5',
		  'php5-dev',
		  'php5-xdebug',
		  'php5-mcrypt'
		]:
		ensure => present,
		require => Exec['apt_update']
	}

	# Ubuntu 14.04 issue, enable mcrypt manually, e.g.: https://stackoverflow.com/questions/30660369/php5enmod-mcrypt-with-puppet/30679552
  exec { "php5enmod mcrypt && service apache2 reload":
    require => Package['php5-mcrypt']
  }

}
