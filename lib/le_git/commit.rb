module Github
  class Commit
    include HappyMapper

    element :message, String
    element :url,     String
    element :id,      String
    element :tree,    String

    def self.master(repo_owner, repo_name)
      xml = list_commits_resource(repo_owner, repo_name).get
      parse(xml)
    end

    protected
      extend ApiResources
  end
end
