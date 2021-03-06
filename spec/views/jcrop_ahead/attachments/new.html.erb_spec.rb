require 'spec_helper'

describe "attachments/new" do
  before(:each) do
    assign(:attachment, stub_model(Attachment,
      :image => "MyString",
      :attachable => nil
    ).as_new_record)
  end

  it "renders new attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachments_path, "post" do
      assert_select "input#attachment_image[name=?]", "attachment[image]"
      assert_select "input#attachment_attachable[name=?]", "attachment[attachable]"
    end
  end
end
