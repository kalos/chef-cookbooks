default[:php_fcgi][:user]           = "www-data"
default[:php_fcgi][:max_children]   = 5
default[:php_fcgi][:max_request]    = 1024

default[:php_fcgi][:xc_cacher]      = "on"
default[:php_fcgi][:xc_stat]        = "on"
default[:php_fcgi][:xc_optimizer]   = "off"
default[:php_fcgi][:xc_size]        = "64M"
default[:php_fcgi][:xc_var_size]    = "16M"

require 'digest/md5'
default[:php_fcgi][:xc_user]        = "kalos"
default[:php_fcgi][:xc_pass]        = Digest::MD5.hexdigest("kalos")
