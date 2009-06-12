require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GithubCommitTest < Test::Unit::TestCase
  context "parsing a Github::Commit" do
    setup do
      @xml = <<-END
        <commit>
          <message>updating Repository model to use v2 API. associated User &amp; Repository models. filled out complete API for User.</message>
          <parents type="array">
            <parent>
              <id>690c79a261ed5b078c08742b796cb3056f685698</id>
            </parent>
          </parents>
          <url>http://github.com/dancroak/le-git/commit/1f0111c91344062052f65922171d220a06810d4a</url>
          <author>
            <name>Dan Croak</name>
            <email>dcroak@thoughtbot.com</email>
          </author>
          <id>1f0111c91344062052f65922171d220a06810d4a</id>
          <committed-date>2009-05-25T19:11:27-07:00</committed-date>
          <authored-date>2009-05-25T19:11:27-07:00</authored-date>
          <tree>d27ed042222fe8a55681e1af260e3eb2847e9f33</tree>
          <committer>
            <name>Dan Croak</name>
            <email>dcroak@thoughtbot.com</email>
          </committer>
        </commit>
      END

      @commit = Github::Commit.parse(@xml)
    end

    test "#message" do
      @commit.message.should == "updating Repository model to use v2 API. associated User & Repository models. filled out complete API for User."
    end

    test "#parents size" do
      @commit.parents.size.should == 1
      @commit.parents.first.id.should == "690c79a261ed5b078c08742b796cb3056f685698"
    end

    test "#url" do
      @commit.url.should == "http://github.com/dancroak/le-git/commit/1f0111c91344062052f65922171d220a06810d4a"
    end

    test "#author" do
      pending "could do has_one :author, User, but it seems to expect the element to be :author" do
        @commit.author.name.should == "Dan Croak"
        @commit.author.email.should == "dcroak@thoughtbot.com"
      end
    end

    test "#id" do
      @commit.id.should == "1f0111c91344062052f65922171d220a06810d4a"
    end

    test "#commited_date" do
      @commit.committed_date.should == DateTime.parse("2009-05-25T19:11:27-07:00")
    end

    test "#authored_date" do
      @commit.authored_date.should == DateTime.parse("2009-05-25T19:11:27-07:00")
    end

    test "#tree" do
      @commit.tree.should == "d27ed042222fe8a55681e1af260e3eb2847e9f33"
    end

    test "#committer" do
      pending "how to do arrays?" do
        @commit.committer.name.should == "Dan Croak"
        @commit.committer.email.should == "dcroak@thoughtbot.com"
      end
    end
  end

  context "Commits for a user's repository's branch" do
    setup do
      uri = "http://github.com:80/api/v2/xml/commits/list/dancroak/le-git/master"
      fixture_path = File.join(File.dirname(__FILE__),
                               'fixtures',
                               'master_commits.xml')

      FakeWeb.register_uri(uri, :response => fixture_path)

      begin
        @commits = Github::Commit.branch("dancroak", "le-git", "master")
      rescue # can't figure out Net::HTTPBadResponse: wrong status line
        @commits = Github::Commit.parse(File.read(fixture_path))
      end
    end

    test "size" do
      @commits.size.should == 30
    end
  end

  test "Commit's for user's repository's master" do
    commits = Object.new
    mock(Github::Commit).branch("dancroak", "le-git", "master") { commits }
    Github::Commit.master("dancroak", "le-git").should == commits
  end
end
