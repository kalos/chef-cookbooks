maintainer       "Calogero Lo Leggio"
maintainer_email "kalos@nerdrug.org"
license          "Apache 2.0"
description      "Installs/Configures web stats with awstats and visitors"
version          "0.2"

%w{ ubuntu debian }.each do |os|
    supports os
end

depends "webapps"

## TODO
# - refactoring stats.rb

attribute "webstats/path_pages",
  :display_name => "path of stats pages",
  :description => "Location of the stats pages",
  :default => "/srv/www/_stats/sites"
