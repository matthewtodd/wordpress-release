require 'rake/clean'
require 'rake/rdoctask'

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wordpress/release'

spec = Gem::Specification.new do |spec|
  spec.name             = 'wordpress-release'
  spec.version          = Wordpress::Release::VERSION
  spec.summary          = "Upgrades a directory to Wordpress #{Wordpress::Release::VERSION}."
  spec.files            = FileList['*.rdoc', 'lib/**/*.rb', 'resources/*'].to_a
  spec.has_rdoc         = true
  spec.rdoc_options     = %W[--main README.rdoc --title #{spec.name}-#{spec.version} --inline-source --line-numbers --all]
  spec.extra_rdoc_files = FileList['*.rdoc'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

desc 'Generate documentation'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir   = 'docs'
  rdoc.options    = spec.rdoc_options
  rdoc.rdoc_files = spec.files.reject { |name| name =~ /resources/ }
end
