maintainer       "Calogero Lo Leggio"
maintainer_email "kalos@nerdrug.org"
license          "Apache 2.0"
description      "Installs/Configures phpmyadmin"
version          "0.2"

%w{ ubuntu debian }.each do |os|
  supports os
end

depends "nginx"
