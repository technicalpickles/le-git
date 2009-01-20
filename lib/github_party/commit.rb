module GitHub
  class Commit
    include HappyMapper

    tag "commit"

    element :url, String
    element :tree, String
    element :message, String
    element :id, String

    def self.find(id)
      xml = RestClient.get("http://github.com/api/v1/xml/defunkt/github-gem/commit/#{id}")
      commits = parse(xml)
      commits.first # TODO assert size of commits
    end

  end
end
