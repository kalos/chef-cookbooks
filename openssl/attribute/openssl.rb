openssl Mash.new unless attribute?(:openssl)
openssl[:country_name] = "IT"
openssl[:state_name] = "Italy"
#openssl[:locality_name] = "Rome"
openssl[:company_name] = "*.nerdrug.org"
openssl[:organizational_unit_name] = "web services"
openssl[:email_address] = "root@nerdrug.org"
