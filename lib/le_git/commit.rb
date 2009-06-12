module Github
  class Commit
    include HappyMapper

    element :message, String
    element :url,     String
    element :id,      String
    element :tree,    String
    element 'committed-date', DateTime
    element 'authored-date', DateTime
    has_many :parents, Parent

    def self.branch(repo_owner, repo_name, branch)
      xml = list_commits_resource(repo_owner, repo_name).get
      parse(xml)
    end

    def self.master(repo_owner, repo_name)
      branch(repo_owner, repo_name, 'master')
    end

    protected
      extend ApiResources
  end
end
