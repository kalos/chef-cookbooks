::Chef::Node.send(:include, Opscode::OpenSSL::Password)

#database_server = search(:node, "database_master:true").map {|n| n['fqdn']}.first

default[:webapps][:phpmyadmin][:version]  = "3.2.4"

default[:webapps][:phpmyadmin][:db_host]   = "yubaba"
default[:webapps][:phpmyadmin][:db_port]   = "3306"
default[:webapps][:phpmyadmin][:ssl]       = "true"
default[:webapps][:phpmyadmin][:conn_type] = "tcp"
default[:webapps][:phpmyadmin][:extension] = "mysqli"
default[:webapps][:phpmyadmin][:compress]  = "on"
default[:webapps][:phpmyadmin][:auth_type] = "cookie"

default[:webapps][:phpmyadmin][:blowpw]    = secure_password
default[:webapps][:phpmyadmin][:lang]      = "en-utf-8"
