# It's a GitHub party, and your invited!

[GitHub](http://github.com) offers an API to some of its data. See [The GitHub API](http://github.com/guides/the-github-api) for details.

github-party provides a Ruby wrapper around the API using [rest-client](http://rest-client.heroku.com/rdoc/) and [happymapper](http://happymapper.rubyforge.org/).

Below is the [The GitHub API](http://github.com/guides/the-github-api), but using github-party:

    
    require 'rubygems'
    require 'github_party'

    # Grabbing all recent commits:
    commits = GitHub::Commit.find "caged", "gitnub", :all

    # Grabbing a single commit:
    commit = GitHub::Commit.find "defunkt", "github-gem", "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"

    # Repository search:
    repositories = GitHub::Repository.search "merb"

    # You can also grab a user’s info, including a list of his repositories:
    repository = GitHub::User.find "defunkt"

## TODO

 * Commit
   * Committed/authored date. [HappyMapper needs to support dashes first](http://jnunemaker.lighthouseapp.com/projects/20014-happy-mapper/tickets/6-specifying-attributeselements-with-dashes-fails)
   * Added/modified/deleted files
   * Parent
   * Author/commiter

 * General
  * Try moving back to HTTParty
  * Most seem to support pagination
  * Connect the classes. For example, repository.commits should hit the GitHub::Commit API

