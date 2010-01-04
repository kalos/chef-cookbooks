maintainer        "Calogero Lo Leggio"
maintainer_email  "kalos@nerdrug.org"
license           "Apache 2.0"
description       "Installs and configures nginx"
version           "0.8"

%w{ ubuntu debian }.each do |os|
  supports os
end

#recommends "apt"
suggests   "php-fcgi"
suggests   "ruby-enterprise"

recipe     "nginx::passenger", "Phusion Passenger (mod_rails) for nginx"

attribute "nginx/binary",
  :display_name => "Nginx Binary",
  :description => "Location of the nginx server binary",
  :default => "/usr/sbin/nginx"

attribute "nginx/user",
  :display_name => "Nginx User",
  :description => "User nginx will run as",
  :default => "www-data"

attribute "nginx/group",
  :display_name => "Nginx Group",
  :description => "Group nginx will run as",
  :default => "www-data"

attribute "nginx/dir",
  :display_name => "Nginx Directory",
  :description => "Location of nginx configuration files",
  :default => "/etc/nginx"

attribute "nginx/dir_extra_conf",
  :display_name => "Nginx extra conf Directory",
  :description => "Sublocation of nginx extra configuration files",
  :default => "conf.d"

attribute "nginx/log_dir",
  :display_name => "Nginx Log Directory",
  :description => "Location for nginx logs",
  :default => "/var/log/nginx"

attribute "nginx/www_path",
  :display_name => "sites location",
  :description => "Location for nginx sites",
  :default => "/srv/www"

attribute "nginx/webapps_path",
  :display_name => "webapps location",
  :description => "Location for web applications",
  :default => "_apps"

#attribute "nginx/worker_processes",
#  :display_name => "Nginx Worker Processes",
#  :description => "Number of worker processes",
#  :default => "1"

attribute "nginx/worker_connections",
  :display_name => "Nginx Worker Connectios",
  :description => "Number of worker connections",
  :default => "1024"

attribute "nginx/worker_priority",
  :display_name => "Nginx Worker Priority",
  :description => "Priority of worker",
  :default => "-5"

attribute "nginx/worker_connections",
  :display_name => "Nginx Worker Connections",
  :description => "Number of connections per worker",
  :default => "1024"

attribute "nginx/sendfile",
  :display_name => "Nginx sendfile",
  :description => "Increase overall system performance if you allow downloads of large to medium sized files",
  :default => "on"

attribute "nginx/keepalive",
  :display_name => "Nginx Keepalive",
  :description => "Whether to enable keepalive",
  :default => "on"

attribute "nginx/keepalive_timeout",
  :display_name => "Nginx Keepalive Timeout",
  :default => "75"

attribute "nginx/server_names_hash_bucket_size",
  :display_name => "Nginx Server Names Hash Bucket Size",
  :default => "64"

attribute "nginx/charset",
  :display_name => "Nginx charset",
  :description => "Adds the line 'Content-Type' into response-header with indicated encoding",
  :default => "utf-8"

attribute "nginx/log_not_found",
  :display_name => "Nginx write log_not_found",
  :description => "Enables or disables logging of requests that resolve into 404 status code",
  :default => "on"

attribute "nginx/server_tokens",
  :display_name => "Nginx send version number of itself",
  :description => "Whether to send the Nginx version number in error pages and Server header",
  :default => "off"

attribute "nginx/gzip",
  :display_name => "Nginx Gzip",
  :description => "Whether gzip is enabled",
  :default => "on"

attribute "nginx/gzip_http_version",
  :display_name => "Nginx Gzip HTTP Version",
  :description => "Version of HTTP Gzip",
  :default => "1.0"

attribute "nginx/gzip_comp_level",
  :display_name => "Nginx Gzip Compression Level",
  :description => "Amount of compression to use",
  :default => "7"

attribute "nginx/gzip_proxied",
  :display_name => "Nginx Gzip Proxied",
  :description => "Whether gzip is proxied",
  :default => "any"

attribute "nginx/gzip_min_length",
  :display_name => "Nginx Gzip compress min length",
  :description => "Sets the minimum length of of the response that will be compressed",
  :default => "64"

attribute "nginx/gzip_types",
  :display_name => "Nginx Gzip Types",
  :description => "Supported MIME-types for gzip",
  :type => "array",
  :default => [ "text/plain", "text/html", "text/css", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript" ]

attribute "nginx/fcgi",
  :display_name => "fcgi support",
  :description => "nginx with fcgi support (I suggest php-fpm)"

attribute "nginx/passenger",
  :display_name => "nginx-passenger",
  :description => "nginx with passenger support"
