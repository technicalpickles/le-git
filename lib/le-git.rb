require 'happymapper'
require 'rest_client'

module Github
  autoload :User, 'le-git/user'
  autoload :Repository, 'le-git/repository'
  autoload :Commit, 'le-git/commit'
  autoload :Parent, 'le-git/parent'
  autoload :ApiResources, 'le-git/resources'
end
