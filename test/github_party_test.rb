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

    test "#repositories" do
      @user.repositories.size.should == 39
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

  end
end
