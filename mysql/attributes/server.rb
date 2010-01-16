if recipe?("mysql::server")
  ::Chef::Node.send(:include, Opscode::OpenSSL::Password)

  default[:mysql][:server_debian_password] = secure_password
  default[:mysql][:server_root_password]   = secure_password
  default[:mysql][:bind_address]           = ipaddress
  default[:mysql][:datadir]                = "/var/lib/mysql"

  # Tunables
  default[:mysql][:tunable][:key_buffer]          = "250M"
  default[:mysql][:tunable][:max_connections]     = "800"
  default[:mysql][:tunable][:wait_timeout]        = "180"
  default[:mysql][:tunable][:net_read_timeout]    = "30"
  default[:mysql][:tunable][:net_write_timeout]   = "30"
  default[:mysql][:tunable][:back_log]            = "128"
  default[:mysql][:tunable][:table_cache]         = "128"
  default[:mysql][:tunable][:max_heap_table_size] = "32M"
end
