package { "samba" : 
   ensure => installed
}

service { ["smbd","nmbd"] :
   ensure => running
}

file { '/etc/samba/smb.conf' :
	content => '
[global]
   workgroup = WORKGROUP
   server string = %h server (Samba, Ubuntu)
   dns proxy = no
   log file = /var/log/samba/log.%m
   max log size = 1000
   syslog = 0
   panic action = /usr/share/samba/panic-action %d
   security = user
   encrypt passwords = true
   passdb backend = tdbsam
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change = yes
   map to guest = bad user
   usershare allow guests = no

[homes]
   comment = Home Directories
   browseable = yes
   read only = no
   create mask = 0755
   directory mask = 0755
   valid users = %S
   writable = yes' 
}