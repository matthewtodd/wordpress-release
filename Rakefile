require 'rubygems'
require 'rake/gemreleasetask'

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'wordpress/release'

spec = Gem::Specification.new do |spec| 
  spec.name             = 'wordpress-release'
  spec.version          = Wordpress::Release::VERSION
  spec.summary          = "Upgrades a directory to Wordpress #{Wordpress::Release::VERSION}."
  spec.files            = FileList['README', 'lib/**/*.rb', 'resources/*'].to_a
  spec.has_rdoc         = true
  spec.rdoc_options     = ['--all']
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
  spec.homepage         = 'http://docs.matthewtodd.org/wordpress-release'
end

Rake::GemReleaseTask.new(spec) do |task|
  task.remote_gem_host  = 'woodward'
  task.remote_gem_dir   = '/users/home/matthew/domains/gems.matthewtodd.org/web/public'
  task.remote_docs_host  = 'woodward'
  task.remote_docs_dir   = '/users/home/matthew/domains/docs.matthewtodd.org/web/public/wordpress-release'
end
