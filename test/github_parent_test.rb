require File.join(File.dirname(__FILE__), '/test_helper.rb')

class GithubParentTest < Test::Unit::TestCase
  context "parsing a Github::Parent" do
    setup do
      xml = <<-END
        <parent>
          <id>690c79a261ed5b078c08742b796cb3056f685698</id>
        </parent>
      END

      @parent = Github::Parent.parse(xml)
    end

    test "#id" do
      @parent.id.should == "690c79a261ed5b078c08742b796cb3056f685698"
    end
  end
end

