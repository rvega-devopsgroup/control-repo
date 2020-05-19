# A Windows webserver
class role::webserver {
  include profile::base
  include profile::users
  include profile::directory_permissions
  include profile::registry
  include profile::iis
  include profile::packages
}
