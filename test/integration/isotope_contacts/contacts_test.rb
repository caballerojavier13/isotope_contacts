require 'minitest_helper'

describe 'Contact integration' do
  it 'shows a list of contacts when I go to index' do
    contact1 = FactoryGirl.create :contact, first_name: 'Reginald'
    contact2 = FactoryGirl.create :contact, first_name: 'Arthur'
    visit "/isotope_contacts/contacts"
    within '.contacts-module' do
      page.must_have_content('Reginald')
      page.must_have_content('Arthur')
    end
  end

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

  it 'shows me the new contact form on new' do
    visit "/isotope_contacts/contacts/new"
    within '.contact-form-module form' do
      page.must_have_selector 'input#contact_first_name'
      page.must_have_selector 'input#contact_last_name'
      page.must_have_selector 'input[type=submit]'
    end
  end
end
