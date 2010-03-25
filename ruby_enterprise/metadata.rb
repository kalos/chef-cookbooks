maintainer       "Calogero Lo Leggio"
maintainer_email "kalos@nerdrug.org"
license          "Apache 2.0"
description      "Installs/Configures ruby-enterprise"
version          "0.2"

%w{ debian ubuntu }.each do |os|
    supports os
end
