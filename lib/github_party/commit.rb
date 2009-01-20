module GitHub
  class Commit
    include HappyMapper

    tag "commit"

    element :url, String
    element :tree, String
    element :message, String
    element :id, String

    # Find commit(s) for a particular username/repository
    #
    # username:
    #   GitHub username, required, +String+
    #
    # repository:
    #   Name of repository, required, +String+
    #
    # id or :all
    #
    #
    #   GitHub::Commit.find("caged", "gitnub", :all)
    #   GitHub::Commit.find "defunkt", "github-gem", "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"
    def self.find(username, repository, id_or_all)
      case id_or_all
      when :all
        self.find_all username, repository
      else
        self.find_by_id username, repository, id_or_all
      end
    end

    protected
      
    def self.find_all(username, repository)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commits/master")
      parse(xml)
    end

    def self.find_by_id(username, repository, id)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commit/#{id}")
      commits = parse(xml)
      commits.first # TODO assert size of commits
    end
  end

end
