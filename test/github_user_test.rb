require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GithubUserTest < Test::Unit::TestCase
  context "searching users" do
    setup do
      fixture_path = File.join(File.dirname(__FILE__), 'fixtures', 'search_users.xml')
      FakeWeb.register_uri('http://github.com/api/v2/xml/user/search/tech',
                           :response => fixture_path)

      @users = Github::User.search('tech')
    end

    test "#size" do
      @users.size.should == 19
    end
  end

  context "parsing a Github::User search result" do
    setup do
      @xml = <<-XML
        <user>
          <score type="float">2.3766692</score>
          <name>techcrunch</name>
          <actions type="integer">35</actions>
          <language>PHP</language>
          <followers type="integer">24</followers>
          <username>techcrunch</username>
          <type>user</type>
          <fullname>TechCrunch</fullname>
          <repos type="integer">2</repos>
          <id>user-14080</id>
          <pushed>2009-05-17T09:15:35.542Z</pushed>
          <created>2008-06-17T19:10:49Z</created>
          <location>Atherton, CA</location>
        </user>
      XML
      @user = Github::User.parse(@xml)
    end

    test "#score" do
      @user.score.should == 2.3766692
    end

    test "#actions" do
      @user.actions.should == 35
    end

    test "#language" do
      @user.language.should == "PHP"
    end

    test "#username" do
      @user.username.should == "techcrunch"
    end

    test "#fullname" do
      @user.fullname.should == "TechCrunch"
    end

    test "#id" do
      @user.id.should == "user-14080"
    end

    test "#pushed" do
      @user.pushed.should == DateTime.parse("2009-05-17T09:15:35.542Z")
    end

    test "#created" do
      @user.created.should == DateTime.parse("2008-06-17T19:10:49Z")
    end

    test "#location" do
      @user.location.should == "Atherton, CA"
    end

  end

  context "parsing a found Github::User" do
    setup do
      @xml = <<-XML
        <user>
          <name>Dan Croak</name>
          <company>thoughtbot</company>
          <following-count type="integer">76</following-count>
          <public-gist-count type="integer">52</public-gist-count>
          <public-repo-count type="integer">21</public-repo-count>
          <blog>http://dancroak.com</blog>
          <id type="integer">198</id>
          <followers-count type="integer">52</followers-count>
          <login>dancroak</login>
          <location>Boston</location>
          <email>dcroak@thoughtbot.com</email>
          <created-at type="datetime">2008-02-12T18:48:35-08:00</created-at>
        </user>
      XML

      @user = Github::User.parse(@xml)
    end

    test "#name" do
      @user.name.should == "Dan Croak"
    end

    test "#company" do
      @user.company.should == "thoughtbot"
    end

    test "#following_count" do
      @user.following_count.should == 76
    end

    test "#public_gist_count" do
      @user.public_gist_count.should == 52
    end

    test "#public_repo_count" do
      @user.public_repo_count.should == 21
    end

    test "#blog" do
      @user.blog.should == "http://dancroak.com"
    end

    test "#id" do
      @user.id.should == "198"
    end

    test "#followers_count" do
      @user.followers_count.should == 52
    end

    test "#login" do
      @user.login.should == "dancroak"
    end

    test "#location" do
      @user.location.should == "Boston"
    end

    test "#email" do
      @user.email.should == "dcroak@thoughtbot.com"
    end

    test "#created_at" do
      @user.created_at.should == DateTime.parse("2008-02-12T18:48:35-08:00")
    end
  end

  context "A found Github::User" do
    setup do
      fixture_path = File.join(File.dirname(__FILE__), 'fixtures', 'user.xml')
      FakeWeb.register_uri('http://github.com/api/v2/xml/user/show/dancroak',
                           :response => fixture_path)

      @user = Github::User.find('dancroak')
    end

    test "returned kind" do
      @user.class.should == Github::User
    end

    test "#repositories" do
      repositories = Object.new
      mock(Github::Repository).user(@user.login) { repositories }
      @user.repositories.should == repositories
    end

  end
end
