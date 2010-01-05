default[:webapps][:path]      = "_apps"
default[:webapps][:user]      = "www-data"
default[:webapps][:group]     = "www-data"

set[:webapps][:full_path]     = "/srv/www/#{webapps[:path]}"

if recipe?("nginx")
  set[:webapps][:full_path] = "#{nginx[:www_path]}/#{webapps[:path]}"
  set[:webapps][:user]      = nginx[:user]
  set[:webapps][:group]     = nginx[:group]
elsif recipe?("apache2")
  set[:webapps][:full_path] = "/var/www/#{webapps[:path]}"
  set[:webapps][:user]      = apache[:user]
end
