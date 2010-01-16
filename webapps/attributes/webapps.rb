default[:webapps][:path]      = ".apps"
default[:webapps][:user]      = "www-data"
default[:webapps][:group]     = "www-data"

default[:webapps][:www_path]  = "/var/www"

set[:webapps][:full_path]     = "#{webapps[:www_path]}/#{webapps[:path]}"

if attribute?("nginx")
  set[:webapps][:www_path]  = nginx[:www_path]
  set[:webapps][:full_path] = "#{webapps[:www_path]}/#{webapps[:path]}"
  set[:webapps][:user]      = nginx[:user]
  set[:webapps][:group]     = nginx[:group]
  set[:webapps][:log_dir]   = nginx[:log_dir]
elsif attribute?("apache")
  set[:webapps][:full_path] = "#{webapps[:www_path]}/#{webapps[:path]}"
  set[:webapps][:user]      = apache[:user]
  set[:webapps][:log_dir]   = apache[:log_dir]
end
