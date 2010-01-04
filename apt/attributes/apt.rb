default[:apt][:unattended_upgrades] = "true"
default[:apt][:cache_limit] = "150000000"
default[:apt][:mirrors] = [ "mir1.ovh.net", "ftp.fr.debian.org", "ftp.de.debian.org" ]
default[:apt][:extra_sources] = [ "backports" ]
default[:apt][:email_admin] = "root@nerdrug.org"
