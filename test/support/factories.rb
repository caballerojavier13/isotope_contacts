FactoryGirl.define do
  factory :contact, class: IsotopeContacts::Contact do
    first_name 'Test'
    last_name 'Contact'
  end
end
