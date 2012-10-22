exec { "apt_update":
    command => "/usr/bin/apt-get update"
}


package { 'build-essential' : ensure => installed }


package { 'nginx' : ensure => installed }

package { 'ssh' : 
	ensure => installed
}







# Java Environment


package { 
	'default-jdk' : ensure => installed 
}

package {
	'tomcat7' : ensure => installed
}

package {
	'tomcat7-admin' : ensure => installed
}

file { '/etc/tomcat7/tomcat-users.xml' :
	content => '<tomcat-users>
   <role rolename="admin-gui" />
   <role rolename="manager-gui" />
   <role rolename="manager-script" />
   <user name="tomcat" password="tomcat" roles="admin-gui,manager-gui,manager-script"  />
</tomcat-users>' 
}






# Ruby Environment

package { "ruby": ensure => purged }

package { "ruby1.8": ensure => purged }

# package { 'rubygems': ensure => purged }

package { 'libmysqlclient-dev' : ensure => installed }

package { 'libpq-dev' : ensure => installed }

#removido pois deve ser instalado na init
#
#package { 'rubygems1.9.1': ensure => installed }
#package { 'ruby1.9.3': ensure => installed }



package { 'thin':
    provider => 'gem',
    ensure => installed,
    require => Package[[rubygems]]
}


exec { "thin":
    command => "/usr/local/bin/thin install"
}
