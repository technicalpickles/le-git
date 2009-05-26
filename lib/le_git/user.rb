module GitHub
  class User
    include HappyMapper

    tag "user"

    element :company,   String
    element :name,      String
    element :blog,      String
    element :email,     String
    element :location,  String
    element :login,     String

    has_many :repositories, Repository

    def self.find(username)
      xml = RestClient.get("http://github.com/api/v1/xml/#{username}")
      users = parse(xml)
      users.first
    end
  end
end
