require 'minitest_helper'

describe 'Email integration' do
  before do
    @contact = Factory(:contact)
  end

  it 'creates a email on post' do
    attrs = FactoryGirl.build(:email).attributes
    page.driver.follow :post, "/isotope_contacts/contacts/#{@contact.id}/emails", email: attrs
    IsotopeContacts::Email.count.must_equal 1
  end

  it 'shows me the edit email form on edit' do
    email = FactoryGirl.create :email
    visit "/isotope_contacts/contacts/#{email.contact.id}/emails/#{email.id}/edit"
    within '.email-form-module form' do
      page.must_have_selector 'input#email_name'
      page.must_have_selector 'input#email_email'
      page.must_have_selector 'input[type=submit]'
    end
  end

  it 'destroys a email on delete' do
    email = FactoryGirl.create :email
    page.driver.follow :delete, "/isotope_contacts/contacts/#{email.contact.id}/emails/#{email.id}"
    IsotopeContacts::Email.find_by_id(email.id).must_equal nil
  end
end
