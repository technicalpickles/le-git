# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{le-git}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols", "Dan Croak"]
  s.date = %q{2009-06-12}
  s.description = %q{Ruby wrapper around Github API v2}
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    "LICENSE",
     "README.textile",
     "lib/le-git.rb",
     "lib/le-git/commit.rb",
     "lib/le-git/parent.rb",
     "lib/le-git/repository.rb",
     "lib/le-git/resources.rb",
     "lib/le-git/user.rb",
     "rails/init.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dancroak/le-git}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby wrapper around Github API v2}
  s.test_files = [
    "test/github_commit_test.rb",
     "test/github_parent_test.rb",
     "test/github_repository_test.rb",
     "test/github_user_test.rb",
     "test/test_helper.rb"
  ]

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
