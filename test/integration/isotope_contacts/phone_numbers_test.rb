require 'minitest_helper'

describe 'Phone Number integration' do
  before do
    @contact = Factory(:contact)
  end

  it 'creates a phone number on post' do
    attrs = FactoryGirl.build(:phone_number).attributes
    page.driver.follow :post, "/isotope_contacts/contacts/#{@contact.id}/phone_numbers", phone_number: attrs
    IsotopeContacts::PhoneNumber.count.must_equal 1
  end

  it 'shows me the edit phone number form on edit' do
    phone_number = FactoryGirl.create :phone_number
    visit "/isotope_contacts/contacts/#{phone_number.contact.id}/phone_numbers/#{phone_number.id}/edit"
    within '.phone-number-form-module form' do
      page.must_have_selector 'input#phone_number_name'
      page.must_have_selector 'input#phone_number_number'
      page.must_have_selector 'input[type=submit]'
    end
  end

  it 'destroys a phone number on delete' do
    phone_number = FactoryGirl.create :phone_number
    page.driver.follow :delete, "/isotope_contacts/contacts/#{phone_number.contact.id}/phone_numbers/#{phone_number.id}"
    IsotopeContacts::PhoneNumber.find_by_id(phone_number.id).must_equal nil
  end
end
