default[:webstats][:path_pages] = "#{webapps[:www_path]}/.stats/sites"
default[:webstats][:lang] = "it_IT.UTF-8"

if attribute?("webstats")
  set[:webstats][:nginx_tmpl] = 'on'
else
  set[:webstats][:nginx_tmpl] = 'off'
end
