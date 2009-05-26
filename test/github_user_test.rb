require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GitHubUserTest < Test::Unit::TestCase
  context "A GitHub::User" do
    setup do
      fixture_path = File.join(File.dirname(__FILE__), 'fixtures', 'user.xml')
      FakeWeb.register_uri('http://github.com/api/v2/xml/user/search/dancroak',
                           :response => fixture_path)

      @user = GitHub::User.find('dancroak')
    end

    test "#name" do
      @user.name.should == "dancroak"
    end

    test "#language" do
      @user.language.should == "Ruby"
    end

    test "#location" do
      @user.location.should == "Boston"
    end

    test "#repos" do
      @user.repos == 18
    end

    test "#followers" do
      @user.followers == 50
    end
  end
end
