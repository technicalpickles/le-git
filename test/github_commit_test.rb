require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GitHubCommitTest < Test::Unit::TestCase

  context "A single commit" do
    setup do
      FakeWeb.register_uri("http://github.com/api/v1/xml/defunkt/github-gem/commit/c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b", :response => File.join(File.dirname(__FILE__), 'fixtures', 'commit.xml'))
      @commit = GitHub::Commit.find "c26d4ce9807ecf57d3f9eefe19ae64e75bcaaa8b"
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

    test "#parents size" do
      pending "Not adding parents yet" do
        @commit.parents.size.should == 1
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
      pending "need to figure out how datey stuff works"

    end

    test "#authored_date" do
      pending "need to figure out how datey stuff works"
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

end
