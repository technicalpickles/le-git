require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GitHubRepositoryTest < Test::Unit::TestCase
  context "searching repositories" do
    setup do
      FakeWeb.register_uri('http://github.com/api/v1/xml/search/merb', :response => File.join(File.dirname(__FILE__), 'fixtures', 'search.xml'))

      @repositories = GitHub::Repository.search("merb")
    end

    test "size" do
      @repositories.size.should == 30
    end

    context "first" do
      setup do
        @repository = @repositories.first
      end

      test "#name" do
        @repository.name.should == "merb"
      end

      test "#watchers" do
        @repository.watchers.should == 15
      end

      test "#private" do
        @repository.private.should == false
      end

      test "#description" do
        @repository.description.should == "Merb official repository"
      end

      test "#forks" do
        @repository.forks.should == 0
      end

      test "#homepage" do
        @repository.homepage.should == "http://www.merbivore.com"
      end

      test "#owner" do
        @repository.owner.should == "merb"
      end
    end
  end
end
