# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wordpress-release}
  s.version = "2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2009-01-02}
  s.email = %q{matthew.todd@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "TODO.rdoc"]
  s.files = ["CHANGELOG.rdoc", "README.rdoc", "TODO.rdoc", "lib/wordpress/release.rb", "resources/wordpress-2.7.tar.gz"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.rdoc", "--title", "wordpress-release-2.7", "--inline-source", "--line-numbers", "--all"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Upgrades a directory to Wordpress 2.7.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
