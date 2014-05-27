module JcropAhead
	module Attachable
		extend ActiveSupport::Concern

		included do
			extend Forwardable

			def_delegators :attachment, :image_url

			has_one :attachment, :as => :attachable, :dependent => :destroy 

			def cropped_image
				if attachment
					attachment.image_url(:big_thumb)
				else
					"assets/nologo.jpg"
				end
			end
		end


	end
end