require 'rails/generators/base'

module JcropAhead
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Installs jcropAhead in your app"
    
    def copy_uploader
    	template "jcrop_ahead_uploader.rb", "config/initializers/jcrop_ahead_uploader.rb"
    end

    def copy_js
    	template "crop_images.js.coffee", "app/assets/javascripts/crop_images.js.coffee"
    end

    def declare_gems
    	gem "mini_magick"
    	gem "carrierwave"
    end

    def mount_engine
       route("mount JcropAhead::Engine => '/'")
    end
    
  end
end