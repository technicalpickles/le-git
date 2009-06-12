require 'happymapper'
require 'rest_client'

module Github
  autoload :User, 'le_git/user'
  autoload :Repository, 'le_git/repository'
  autoload :Commit, 'le_git/commit'
  autoload :ApiResources, 'le_git/resources'
end
