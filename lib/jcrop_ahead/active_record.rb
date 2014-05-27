module JcropAhead
	module ActiveRecord

		def has_jcrop
			class_eval <<-RUBY
				include JcropAhead::Attachable
			RUBY
		end
		
	end
end
ActiveRecord::Base.extend JcropAhead::ActiveRecord