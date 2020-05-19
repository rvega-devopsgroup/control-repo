# Package Management
#	  - Install 7-zip using the puppet/staging archive module - depreciated module use puppet/archive instead
#   - Install 7-zip using chocolatey and the puppetlabs/chocolatey forge module
class profile::packages {
  include 'archive'
}
