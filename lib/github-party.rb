require 'rubygems'
require 'httparty'
require 'cgi'

class GitHubParty
  include HTTParty
  base_uri 'github.com/api/v1/json'
  
  def self.user(user)
    get("/#{user}").to_struct.user
  end
  
  def self.search(terms)
    escaped_terms = CGI.escape(terms)
    
    repository_hashes = get("/search/#{escaped_terms}")['repositories']
    repository_hashes.collect {|r| r.to_struct}
  end
end