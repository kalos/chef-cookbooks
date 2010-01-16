::Chef::Node.send(:include, Opscode::OpenSSL::Password)

default[:webapps][:roundcube][:chef_query]  = "*";

default[:webapps][:roundcube][:version]     = "0.3.1";
default[:webapps][:roundcube][:db_provider] = "mysql://roundcube:#{secure_password}@yubaba/roundcube"
default[:webapps][:roundcube][:mail_server] = "ssl://kiki";
default[:webapps][:roundcube][:smtp_server] = "ssl://kiki";
default[:webapps][:roundcube][:caching]     = "FALSE";
default[:webapps][:roundcube][:force_ssl]   = "TRUE";
default[:webapps][:roundcube][:lang]        = "it_IT";
default[:webapps][:roundcube][:page_title]  = "webmail";
default[:webapps][:roundcube][:drafts_mbox] = "Drafts";
default[:webapps][:roundcube][:junk_mbox]   = "Spam";
default[:webapps][:roundcube][:sent_mbox]   = "Sent";
default[:webapps][:roundcube][:trash_mbox]  = "Trash";
