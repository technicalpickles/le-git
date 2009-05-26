module Github
  class Commit
    include HappyMapper

    element :url,     String
    element :tree,    String
    element :message, String
    element :id,      String

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
      commits.first
    end
  end
end
