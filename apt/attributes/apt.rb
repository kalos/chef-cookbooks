default[:apt][:unattended_upgrades] = true
<<<<<<< HEAD
default[:apt][:cache_limit] = "150000000"
default[:apt][:mirrors] = [ "mir1.ovh.net", "ftp.fr.debian.org", "ftp.de.debian.org" ]
default[:apt][:extra_sources] = [ "backports", "opscode" ]
default[:apt][:email_admin] = "root@nerdrug.org"
=======
default[:apt][:cache_limit]         = "150000000"
default[:apt][:mirrors]             = [ "ftp.it.debian.org", "ftp.de.debian.org" ]
default[:apt][:extra_sources]       = [ "testing", "backports", "opscode" ]
default[:apt][:sources]             = false
default[:apt][:email_admin]         = "sistemistica@teleunit.it"
default[:apt][:proxy_url]           = ""
>>>>>>> 0b8cbb5... APT recipe: added apt-proxy
