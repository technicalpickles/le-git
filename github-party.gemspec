# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{github-party}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2009-01-20}
  s.description = %q{TODO}
  s.email = %q{josh@technicalpickles.com}
  s.files = ["VERSION.yml", "lib/github_party", "lib/github_party/commit.rb", "lib/github_party/repository.rb", "lib/github_party/user.rb", "lib/github_party.rb", "test/fixtures", "test/fixtures/commit.xml", "test/fixtures/commits.xml", "test/fixtures/search.xml", "test/fixtures/user.xml", "test/github_commit_test.rb", "test/github_repository_test.rb", "test/github_user_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/technicalpickles/github-party/tree}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<happymapper>, [">= 0"])
    else
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<happymapper>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<happymapper>, [">= 0"])
  end
end
