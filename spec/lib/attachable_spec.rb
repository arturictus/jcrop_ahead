require 'spec_helper'


class TestMigration < ActiveRecord::Migration
  def self.up
    create_table :attach_examples, :force => true do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :attach_examples
  end
end

class AttachExample < ActiveRecord::Base
  include Attachable
end # setup a basic AR class for testing


describe AttachExample do

  describe 'Attachable' do

    before(:all) { TestMigration.up }
    after(:all) { TestMigration.down }
    after { AttachExample.delete_all }

    before(:each) do
      ActiveRecord::Base.include_root_in_json = false
      @event = AttachExample.create!(:name => "whatever")
      @event.attachament = FactoryGirl.create(:attachament)
      @event.save
    end

    it "has method image_url" do
      respond = @event.respond_to?(:image_url)
      respond.should be(true)
    end
    it "has method cropped_image" do
      respond = @event.respond_to?(:cropped_image)
      respond.should be(true)
    end

    it "delegates image_url to attachment" do
      ev = @event.image_url
      at = @event.attachament.image_url
      ev.should eq at
    end 
  end
end
    