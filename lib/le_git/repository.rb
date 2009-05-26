module GitHub
  class Repository
    include HappyMapper

    tag "repository"

    element :owner,       String
    element :forks,       Integer
    element :name,        String
    element :private,     Boolean
    element :url,         String
    element :watchers,    Integer
    element :fork,        Boolean
    element :homepage,    String
    element :description, String

    def self.search(query)
      xml = RestClient.get("http://github.com/api/v1/xml/search/#{query}")
      parse(xml)
    end
  end
end
