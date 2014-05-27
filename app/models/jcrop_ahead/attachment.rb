module JcropAhead
  class Attachment < ActiveRecord::Base
    belongs_to :attachable, :polymorphic => true

	#validates_presence_of :image
	validates_presence_of :attachable_id
	validates_presence_of :attachable_type

	mount_uploader :image, JcropAheadUploader
	
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

	after_update :crop_image
  
	def crop_image
	  image.recreate_versions! if crop_x.present?
	end

  end
end
