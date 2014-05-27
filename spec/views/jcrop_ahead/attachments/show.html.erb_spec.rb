require 'spec_helper'

describe "attachments/show" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :image => "Image",
      :attachable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(//)
  end
end
