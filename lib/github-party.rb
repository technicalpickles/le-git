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
    repository_hashes.collect {|r| r.to_struct }
  end
  
  def self.commits(user, repo, tree = 'master')
    commit_hashes = get("/#{user}/#{repo}/commits/#{tree}")['commits']
    commit_hashes.collect {|c| c.to_struct }
  end
  
  def self.commit(user, repo, commit)
    commit = get("/#{user}/#{repo}/commit/#{commit}")['commit'].to_struct
    %w(added removed modified parents).each do |array|
      structified = commit.send(array).collect {|i| i.to_struct}
      commit.send("#{array}=", structified) 
    end
    commit
  end
end