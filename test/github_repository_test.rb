require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GithubRepositoryTest < Test::Unit::TestCase
  context "parsing a found Github::Repository" do
    setup do
      @xml = <<-END
        <repository>
          <description>Rails plugin. Force major browsers (IE, Firefox, Safari) to reload a page, even when triggered by 'back' button.</description>
          <name>no_cache</name>
          <private type="boolean">false</private>
          <url>http://github.com/dancroak/no_cache</url>
          <fork type="boolean">false</fork>
          <watchers type="integer">10</watchers>
          <forks type="integer">0</forks>
          <owner>dancroak</owner>
          <homepage>http://giantrobots.thoughtbot.com</homepage>
        </repository>
      END
      @repository = Github::Repository.parse(@xml)
    end

    test "#description" do
      @repository.description.should == "Rails plugin. Force major browsers (IE, Firefox, Safari) to reload a page, even when triggered by 'back' button."
    end

    test "#name" do
      @repository.name.should == "no_cache"
    end

    test "#private" do
      @repository.private.should == false
    end

    test "#url" do
      @repository.url.should == "http://github.com/dancroak/no_cache"
    end

    test "#fork" do
      @repository.fork.should == false
    end

    test "#watchers" do
      @repository.watchers.should == 10
    end

    test "#forks" do
      @repository.forks.should == 0
    end

    test "#owner" do
      @repository.owner.should == "dancroak"
    end

    test "#homepage" do
      @repository.homepage.should == "http://giantrobots.thoughtbot.com"
    end
  end

  context "a Github::Repository found via user" do
    setup do
      fixture_path = File.join(File.dirname(__FILE__),
                               'fixtures',
                               'user_repositories.xml')
      FakeWeb.register_uri('http://github.com/api/v2/xml/repos/show/dancroak',
                           :response => fixture_path)

      @repositories = Github::Repository.user("dancroak")
    end

    test "returned kind" do
      @repositories.class.should == Array
      @repositories.each do |repository|
        repository.class.should == Github::Repository
      end
    end

    test "size" do
      @repositories.size.should == 19
    end

    context "first" do
      setup do
        @repository = @repositories.first
      end

      test "#commits" do
        commits = Object.new
        mock(Github::Commit).branch(@repository.owner, @repository.name, 'master') { commits }
        @repository.commits.should == commits
      end

      test "#commits(redesign)" do
        commits = Object.new
        mock(Github::Commit).branch(@repository.owner, @repository.name, 'redesign') { commits }
        @repository.commits('redesign').should == commits

      end

    end
  end
end
