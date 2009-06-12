module Github
  module ApiResources
    def api_resource
      RestClient::Resource.new("http://github.com/api/v2/xml")
    end

    def search_user_resource(username)
      api_resource["user/search/#{username}"]
    end

    def show_repo_resource(name)
      api_resource["repos/show/#{name}"]
    end

    def list_commits_resource(username, repo, branch = 'master')
      api_resource["commits/list/#{username}/#{repo}/#{branch}"]
    end
  end
end
