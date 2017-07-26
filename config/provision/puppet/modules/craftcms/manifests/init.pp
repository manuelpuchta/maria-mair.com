# Install latest CraftCMS

class craftcms::install {

  # Create the craftcms database
  exec { 'create-database':
    unless  => '/usr/bin/mysql -u root -pvagrant craftcms',
    command => '/usr/bin/mysql -u root -pvagrant --execute=\'create database craftcms\'',
  }

  # Create the MySQL user
  exec { 'create-user':
    unless  => '/usr/bin/mysql -u craftcms -craftcms craftcms',
    command => '/usr/bin/mysql -u root -pvagrant --execute="GRANT ALL PRIVILEGES ON craftcms.* TO \'craftcms\'@\'localhost\' IDENTIFIED BY \'craftcms\'"',
  }

  # Get a new copy of the latest craftcms release
  # Download via: http://craftcms.com/latest.tar.gz?accept_license=yes
  exec { 'download-craftcms':
    command => '/usr/bin/wget http://craftcms.com/latest.tar.gz?accept_license=yes',
    cwd     => '/vagrant/',
    creates => '/vagrant/latest.tar.gz?accept_license=yes'
  }

  # Untar/-zip CraftCMS files
  exec { 'untar-craftcms':
    cwd     => '/vagrant/',
    command => '/bin/tar xzvf /vagrant/latest.tar.gz?accept_license=yes',
    require => Exec['download-craftcms']
  }

  # Remove public dir
  file { 'remove_public_directory':
    ensure  => absent,
    path    => '/vagrant/public',
    recurse => true,
    purge   => true,
    force   => true,
    require => Exec['untar-craftcms']
  }

  # Remove latest.tar.gz file
  file { 'remove_tar_cms_file':
    ensure  => absent,
    path    => '/vagrant/latest.tar.gz?accept_license=yes',
    purge   => true,
    force   => true,
    require => Exec['untar-craftcms']
  }

  # Remove readme.txt file
  file { 'remove_craft_readme_file':
    ensure  => absent,
    path    => '/vagrant/readme.txt',
    purge   => true,
    force   => true,
    require => Exec['untar-craftcms']
  }

  # Copy a working config/db.php file for the craft installation
  file { '/vagrant/craft/config/db.php':
    source => 'puppet:///modules/craftcms/db.php',
    require => Exec['untar-craftcms'],
  }

  # Import current MySQL CraftCMS database
  #file { '/tmp/craftcms-db.sql':
  #  source => 'puppet:///modules/craftcms/craftcms-db.sql'
  #}

  #exec { 'load-db':
  #  command => '/usr/bin/mysql -u craftcms -craftcms craftcms < /tmp/craftcms-db.sql && touch /home/vagrant/db-created',
  #  creates => '/home/vagrant/db-created',
  #}

}
