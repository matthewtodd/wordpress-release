require 'tmpdir'

class File #:nodoc:
  def self.relative_path(*parts)
    file = caller.first.split(':').first
    File.join(File.dirname(file), *parts)
  end
end

module Wordpress #:nodoc:
  class Release
    TARBALL = Dir.glob(File.relative_path('..', '..', 'resources', 'wordpress-*.tar.gz')).first
    VERSION = File.basename(TARBALL).match(/wordpress-(.*).tar.gz/).captures.first

    def contents(*parts)
      `tar zxfO #{TARBALL} #{File.join('wordpress', *parts)}`
    end
    
    def upgrade(directory=Dir.pwd)
      system 'mkdir', '-p', tmp
      system 'tar', 'zxf', TARBALL, '--directory', tmp
      
      Dir.chdir(directory) do
        system 'rm', '-r', *wordpress_files if wordpress_files.any?
        system 'cp', '-r', File.join(tmp, 'wordpress', '.'), '.'
      end

      system 'rm', '-r', tmp
    end
    
    private
    
    def tmp
      @tmp ||= File.join(Dir.tmpdir, "wordpress.#{Process.pid}")
    end

    def wordpress_files
      # TODO if you look at this, even though it reads like the Wordpress
      # upgrade documentation, it's not particularly necessary now, is it?
      # delete these
      files = %w( readme.html index.php wp.php xmlrpc.php license.txt )
      files += Dir.glob('wp-*.php')
      files += Dir.glob('wp-admin')
      files += Dir.glob('wp-includes')

      # but don't delete these
      files -= %w( wp-config.php .htaccess robots.txt )
      files -= Dir.glob('wp-content')
      files -= Dir.glob('wp-images')

      # but do delete these
      files += Dir.glob('wp-content/themes/classic')
      files += Dir.glob('wp-content/themes/default')
      
      # if they exist
      files.select { |file| File.exist?(file) }
    end
  end
end