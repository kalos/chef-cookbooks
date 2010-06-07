maintainer       "Calogero Lo Leggio"
maintainer_email "kalos@nerdrug.org"
license          "Apache 2.0"
description      "Installs/Configures ntp"
version          "0.1"

%w{ ubuntu debian }.each do |os|
    supports os
end

attribute "ntp/servers",
  :display_name => "NTP Servers",
  :description => "Array of servers we should talk to",
  :type => "array"
