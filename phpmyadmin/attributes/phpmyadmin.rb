require 'openssl'

blowpw = String.new

while blowpw.length < 40
  blowpw << OpenSSL::Random.random_bytes(1).gsub(/\W/, '')
end

#database_server = search(:node, "database_master:true").map {|n| n['fqdn']}.first

default[:phpmyadmin][:version]  = "3.2.4"

default[:phpmyadmin][:db_host]   = "yubaba"
default[:phpmyadmin][:db_port]   = "3306"
default[:phpmyadmin][:ssl]       = "true"
default[:phpmyadmin][:conn_type] = "tcp"
default[:phpmyadmin][:extension] = "mysqli"
default[:phpmyadmin][:compress]  = "on"
default[:phpmyadmin][:auth_type] = "cookie"

default[:phpmyadmin][:blowpw]    = blowpw
default[:phpmyadmin][:lang]      = "en-utf-8"
