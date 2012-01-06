FactoryGirl.define do
  factory :contact, class: IsotopeContacts::Contact do
    first_name 'Test'
    last_name 'Contact'
  end
  factory :phone_number, class: IsotopeContacts::PhoneNumber do
    number '2055551212'
    name 'Home'
    association :contact
  end
  factory :email, class: IsotopeContacts::Email do
    email 'josh@isotope11.com'
    name 'Home'
    association :contact
  end
end
