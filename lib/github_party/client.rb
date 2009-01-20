module GitHub
  class Client
    def self.user(username)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}")
      users = User.parse(xml)
      users.first # TODO assert count
    end

    def self.search_repositories(query)
      xml = RestClient.get("http://github.com/api/v1/xml/search/#{query}")
      Repository.parse(xml)
    end
  end
end
