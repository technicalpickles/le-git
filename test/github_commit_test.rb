require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GitHubCommitTest < Test::Unit::TestCase

  context "A single commit" do
    setup do
      FakeWeb.register_uri("http://github.com/api/v1/xml/defunkt/github-gem/commit/c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b", :response => File.join(File.dirname(__FILE__), 'fixtures', 'commit.xml'))
      @commit = GitHub::Commit.find "defunkt", "github-gem", "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"
    end

    test "#message" do
      @commit.message.should == "move commands.rb and helpers.rb into commands/ dir"
    end

    test "#removed size" do
      pending "Not adding files yet" do
        @commit.removed.size.should == 2
      end
    end

    test "#added size" do
      pending "Not adding files yet" do
        @commit.added.size.should == 2
      end
    end

    test "#modified size" do
      pending "Not adding files yet" do
        @commit.modified.size.should == 1
      end
    end

    test "#parents" do
      pending "Not adding parents yet" do
        @commit.parents.size.should == 1
        @commit.parents.first.id.should == "d462d2a2e60438ded3dd9e8e6593ca4146c5a0ba"
      end
    end

    test "#url" do
      @commit.url.should == "http://github.com/defunkt/github-gem/commit/c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"

    end

    test "#author" do
      pending "Not adding author yet" do
        @commit.author.name.should == "Chris Wanstrath"
        @commit.author.email.should == "chris@ozmm.org"
      end
    end

    test "#id" do
      @commit.id.should == "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"
    end

    test "#commited_date" do
      pending "happymapper doesn't support dashes yet" do
        @commit.commited_date.should == Date.parse("2008-03-02T16:45:41-08:00")
      end
    end

    test "#authored_date" do
      pending "need to figure out how datey stuff works" do
        @commit.authored_date.should == Date.parse("2008-03-02T16:45:41-08:00")
      end
    end

    test "#tree" do
      @commit.tree.should == "28a1a1ca3e663d35ba8bf07d3f1781af71359b76"
    end

    test "#committer" do
      pending "Not adding committer yet" do
        @commit.committer.name.should == "Chris Wanstrath"
        @commit.committer.email.should == "chris@ozmm.org"
      end
    end
  end

  context "For a project" do
    setup do
      FakeWeb.register_uri("http://github.com/api/v1/xml/caged/gitnub/commits/master", :response => File.join(File.dirname(__FILE__), 'fixtures', 'commits.xml')) 
      @commits = GitHub::Commit.find("caged", "gitnub", :all)
    end

    test "size" do
      @commits.size.should == 30
    end

    context "first commit" do
      setup do
        @commit = @commits.first
      end

      test "#message" do
        @commit.message.should == "This time, lets actually add diff-lcs"
      end

      test "#removed size" do
        pending "Not adding files yet" do
          @commit.removed.should be_nil
        end
      end

      test "#added size" do
        pending "Not adding files yet" do
          @commit.added.should be_nil
        end
      end

      test "#modified size" do
        pending "Not adding files yet" do
          @commit.modified.should be_nil
        end
      end

      test "#parents size" do
        pending "Not adding parents yet" do
          @commit.parents.size.should == 1
          @commits.pararents.first.id.should == "64cefa238db1d5ad62f0560378ddd9cdbfbbfe16"
        end
      end

      test "#url" do
        @commit.url.should == "http://github.com/Caged/gitnub/commit/2f4522c15c8f4734ea7db07f4c355ade06a3f619"

      end

      test "#author" do
        pending "Not adding author yet" do
          @commit.author.name.should == "Justin Palmer"
          @commit.author.email.should == "justin@activereload.net"
        end
      end

      test "#id" do
        @commit.id.should == "2f4522c15c8f4734ea7db07f4c355ade06a3f619"
      end

      test "#commited_date" do
        pending "happymapper doesn't support dashes yet" do
          @commit.commited_date.should == Date.parse("2008-10-17T12:00:08-07:00")
        end
      end

      test "#authored_date" do
        pending "need to figure out how datey stuff works" do
          @commit.authored_date.should == Date.parse("2008-10-17T12:00:08-07:00")
        end
      end

      test "#tree" do
        @commit.tree.should == "489360e07f74e9b0eeea0d8ec07328d3b3a0a947"
      end

      test "#committer" do
        pending "Not adding committer yet" do
          @commit.committer.name.should == "Justin Palmer"
          @commit.committer.email.should == "justin@activereload.net"
        end
      end
    end
  end
end
