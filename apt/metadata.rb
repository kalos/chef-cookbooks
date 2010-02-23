maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Configures apt and apt services"
version           "0.8"
recipe            "apt", "Main apt configuration"
recipe            "apt::proxy", "proxy server"


supports          "debian"

suggests          "apticron"
suggests          "apt-listchanges"

attribute "apt/unattended_upgrades",
  :display_name => "apt autoupdate",
  :description => "Automatic installation of (security) updates",
  :default => "true"

attribute "apt/cache_limit",
  :display_name => "apt cache limit",
  :description => "Limit of apt cache system",
  :default => "150000000"

attribute "apt/mirrors",
  :display_name => "apt mirrors",
  :description => "Mirrors of debian repositories",
  :type => "array",
  :default => [ "mir1.ovh.net", "ftp.fr.debian.org", "ftp2.fr.debian.org", "ftp.de.debian.org", "ftp2.de.debian.org", "ftp.uk.debian.org" ]

attribute "apt/extra_sources",
  :display_name => "extra apt sources",
  :description => "extra apt sources",
  :type => "array",
  :default => [ "backports" ]

attribute "apt/email_admin",
  :display_name => "admin email",
  :description => "email of admin witch receive alarms",
  :default => "root@nerdrug.org"
