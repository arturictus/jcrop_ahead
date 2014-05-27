module JcropAhead
  class Engine < ::Rails::Engine
    isolate_namespace JcropAhead

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    #
    # Load all helpers
    #
    #initializer 'main_app.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper JcropAhead::ApplicationHelper
      end
    #end

    #
    # Extend ActiveRecord
    #
    #initializer "jcrop_ahead.active_record" do
	    # ActiveSupport.on_load :active_record do
		   #  require 'jcrop_ahead/activerecord'
	    # end
	#end

    #
    # Get from main app what you need
    # 
    paths["app/models"] << "../app/models"
    #paths["config"] << "../config"
    #paths["db"] << "../db"
    paths["config/initializers"] << "../config/initializers"
    paths["config/locales"] << "../config/locales"
  end
end
