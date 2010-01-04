case platform
when "debian","ubuntu"
  set[:nginx][:dir]            = "/etc/nginx"
  set[:nginx][:dir_extra_conf] = "conf.d"
  set[:nginx][:log_dir]        = "/var/log/nginx"
  set[:nginx][:user]           = "www-data"
  set[:nginx][:group]          = "www-data"
  set[:nginx][:binary]         = "/usr/sbin/nginx"
else
  set[:nginx][:dir]            = "/etc/nginx"
  set[:nginx][:extra_conf_dir] = "conf.d"
  set[:nginx][:log_dir]        = "/var/log/nginx"
  set[:nginx][:user]           = "www-data"
  set[:nginx][:group]          = "www-data"
  set[:nginx][:binary]         = "/usr/sbin/nginx"
end

default[:nginx][:www_path]     = "/srv/www"
default[:nginx][:webapps_path] = "_apps"

# if worker_processes == 0, they use all CPU's * 2 (if ssl or gzip is enable)
default[:nginx][:worker_processes]              = 2
default[:nginx][:worker_connections]            = 1024
default[:nginx][:worker_priority]               = "-5"
default[:nginx][:sendfile]                      = "on"
default[:nginx][:keepalive]                     = "on"
default[:nginx][:keepalive_timeout]             = 75
default[:nginx][:server_names_hash_bucket_size] = 64
default[:nginx][:charset]                       = "utf-8"
default[:nginx][:log_not_found]                 = "on"
default[:nginx][:server_tokens]                 = "off"

default[:nginx][:gzip]              = "on"
default[:nginx][:gzip_http_version] = "1.0"
default[:nginx][:gzip_comp_level]   = 7
default[:nginx][:gzip_proxied]      = "any"
default[:nginx][:gzip_min_length]   = 64
default[:nginx][:gzip_types] = [
  "text/plain",
  "text/html",
  "text/css",
  "application/x-javascript",
  "text/xml",
  "application/xml",
  "application/xml+rss",
  "text/javascript"
]

default[:nginx][:fcgi] = 'off'
if recipe?("php-fcgi")
  set[:nginx][:fcgi] = 'on'
else
  set[:nginx][:fcgi] = 'off'
end

default[:nginx][:passenger] = 'off'
set[:nginx][:passenger] = 'off' unless (recipe?("apt") || recipe?("ruby-enterprise"))
