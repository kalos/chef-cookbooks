maintainer        "Calogero Lo Leggio"
maintainer_email  "kalos@nerdrug.org"
license           "Apache 2.0"
description       "Installs and maintains php-fcgi and php modules"
version           "0.8"

%w{ubuntu debian}.each do |os|
  supports os
end

recommends        "nginx"

depends           "apt"
recipe            "php-fcgi::module_apc", "Install the php5-apc package"
recipe            "php-fcgi::module_curl", "Install the php5-curl package"
recipe            "php-fcgi::module_fileinfo", "Install the php5-fileinfo package"
recipe            "php-fcgi::module_fpdf", "Install the php-fpdf package"
recipe            "php-fcgi::module_gd", "Install the php5-gd package"
#recipe            "php-fcgi::module_imagick", "Install the php5-imagick package"
recipe            "php-fcgi::module_imap", "Install the php5-imap package"
recipe            "php-fcgi::module_ldap", "Install the php5-ldap package"
recipe            "php-fcgi::module_mail", "Install the php-mail package"
recipe            "php-fcgi::module_mcrypt", "Install the php5-mcrypt package"
recipe            "php-fcgi::module_mdb2", "Install the php-mdb2 package"
recipe            "php-fcgi::module_mdb2_sqlite", "Install the php-mdb2-driver-sqlite package"
recipe            "php-fcgi::module_memcache", "Install the php5-memcache package"
recipe            "php-fcgi::module_mhash", "Install the php5-mhash package"
recipe            "php-fcgi::module_mysql", "Install the php5-mysql package"
recipe            "php-fcgi::module_pgsql", "Install the php5-pgsql package"
recipe            "php-fcgi::module_socket", "Install the php-net-socket package"
recipe            "php-fcgi::module_sqlite", "Install the php5-sqlite package"
recipe            "php-fcgi::pear", "Install the php-pear package"

attribute "php_fcgi/user",
  :display_name => "php-fcgi user",
  :description => "user php-fcgi daemon will run as",
  :default => "www-data"

attribute "php_fcgi/max_children",
  :display_name => "php-fcgi max children",
  :description => "number of maximum children of php-fcgi daemon",
  :default => "5"

attribute "php_fcgi/max_request",
  :display_name => "php-fcgi max request",
  :description => "number of maximum request of php-fcgi daemon",
  :default => "5"
