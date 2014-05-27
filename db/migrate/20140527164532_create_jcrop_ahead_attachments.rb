class CreateJcropAheadAttachments < ActiveRecord::Migration
  def change
    create_table :jcrop_ahead_attachments do |t|
      t.string :image
      t.belongs_to :attachable, polymorphic: true

      t.timestamps
    end
    
    add_index :jcrop_ahead_attachments, [:attachable_id, :attachable_type]
  end
end
