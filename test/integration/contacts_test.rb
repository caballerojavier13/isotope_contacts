require 'minitest_helper'

describe 'Contact integration' do
  it 'shows me the contact when I go to show' do
    contact = FactoryGirl.create :contact, first_name: 'Reginald'
    visit "/isotope_contacts/contacts/#{contact.id}"
    within '.contact-module' do
      page.must_have_content('Reginald')
    end
  end

  it 'creates a contact on post' do
    attrs = FactoryGirl.build(:contact).attributes
    page.driver.follow :post, "/isotope_contacts/contacts", contact: attrs
    IsotopeContacts::Contact.count.must_equal 1
    visit "/isotope_contacts/contacts/#{IsotopeContacts::Contact.last.id}"
  end
end
