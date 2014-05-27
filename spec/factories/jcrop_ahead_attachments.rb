# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jcrop_ahead_attachment, :class => 'Attachment' do
    image "MyString"
    attachable nil
  end
end
