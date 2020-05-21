# A Windows webserver
class role::webserver {
  include profile::base
  include profile::account
  include profile::registry
  include profile::iis
  include profile::packages
}
