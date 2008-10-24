require 'rubygems'
require 'httparty'

class GitHubParty
  include HTTParty
  base_uri 'github.com/api/v1/json'
  def self.user(user)
    get("/#{user}").to_struct.user
  end
end