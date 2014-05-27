require 'spec_helper'

describe "attachments/edit" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :image => "MyString",
      :attachable => nil
    ))
  end

  it "renders the edit attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachment_path(@attachment), "post" do
      assert_select "input#attachment_image[name=?]", "attachment[image]"
      assert_select "input#attachment_attachable[name=?]", "attachment[attachable]"
    end
  end
end
