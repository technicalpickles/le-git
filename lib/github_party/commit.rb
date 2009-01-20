module GitHub
  class Commit
    include HappyMapper

    tag "commit"

    element :url, String
    element :tree, String
    element :message, String
    element :id, String

    def self.find(username, repository, id)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commit/#{id}")
      commits = parse(xml)
      commits.first # TODO assert size of commits
    end

    def self.for_repository(username, repository)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commits/master")
      parse(xml)
    end
  end
end
