module Github
  class Repository
    include HappyMapper

    element :description, String
    element :name,        String
    element :private,     Boolean
    element :url,         String
    element :fork,        Boolean
    element :watchers,    Integer
    element :forks,       Integer
    element :owner,       String
    element :homepage,    String

    def self.user(name)
      xml = show_repo_resource(name).get
      parse(xml)
    end

    def commits(branch = "master")
      Github::Commit.branch(owner, name, branch)
    end

    protected
      extend ApiResources
  end
end
