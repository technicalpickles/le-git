require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GithubPartyTest < Test::Unit::TestCase

  context "A lookedup GitHub::User" do
    setup do
      FakeWeb.register_uri('http://github.com/api/v1/xml/technicalpickles', :response => File.join(File.dirname(__FILE__), 'fixtures', 'user.xml'))

      @user = GitHub::Client.user('technicalpickles')
    end

    test "#name" do
      @user.name.should == "Josh Nichols"
    end


    test "#blog" do
      @user.blog.should == "http://technicalpickles.com"
    end

    test "#login" do
      @user.login.should == "technicalpickles"
    end

    test "#email" do
      @user.email.should == "josh@technicalpickles.com"
    end

    test "#location" do
      @user.location.should == "Boston, MA"
    end

    test "#repositories size" do
      @user.repositories.size.should == 39
    end

    context "#repositories first" do
      setup do
        @repository = @user.repositories.first
      end

      test "#owner" do
        @repository.owner == "technicalpickles"
      end

      test "#forks" do
        @repository.forks == 0
      end

      test "#description" do
        @repository.name == "ambitious-sphinx"
      end

      test "#private" do
        @repository.private.should == false
      end

      test "#url" do
        @repository.url == "http://github.com/technicalpickles/ambitious-sphinx"
      end

      test "#watchers" do
        @repository.watchers == 11
      end

      test "#fork" do
        @repository.fork == false
      end

      test "#homepage" do
        @repository.homepage == ""
      end

    end

  end
end
