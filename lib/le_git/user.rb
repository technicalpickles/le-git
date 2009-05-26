module GitHub
  class User
    include HappyMapper

    tag "user"

    element :name,      String
    element :language,  String
    element :location,  String
    element :repos,     Integer
    element :followers, Integer

    def self.find(username)
      xml = RestClient.get("http://github.com/api/v2/xml/user/search/#{username}")
      users = parse(xml)
      users.first
    end
  end
end
