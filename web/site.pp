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


package {
	'nginx' : ensure => installed
}

package { 'ssh' : 
	ensure => installed
}


