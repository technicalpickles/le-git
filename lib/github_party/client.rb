module GitHub
  class Client
    def self.user(username)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}")
      users = User.parse(xml)
      users.first # TODO assert count
    end
  end
end
