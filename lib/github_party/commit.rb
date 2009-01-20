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
    # hash_or_:all
    #   a commit's hash to get a single commit
    #   OR
    #   :all to get the first 30 commits
    #
    #
    #
    # Example:
    #
    #   GitHub::Commit.find("caged", "gitnub", :all)
    #   GitHub::Commit.find "defunkt", "github-gem", "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"
    #
    def self.find(username, repository, hash_or_all)
      case hash_or_all
      when :all
        self.find_all username, repository
      else
        self.find_by_hash username, repository, hash_or_all
      end
    end

    protected
      
    def self.find_all(username, repository)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commits/master")
      parse(xml)
    end

    def self.find_by_hash(username, repository, hash)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}/#{repository}/commit/#{hash}")
      commits = parse(xml)
      commits.first # TODO assert size of commits
    end
  end

end
