require "minitest_helper"

describe IsotopeContacts::Contact do
  subject do
    IsotopeContacts::Contact.new first_name: 'foo', last_name: 'bar'
  end

  describe "with valid attributes" do
    it "should be valid" do
      subject.valid?.must_equal true
    end
  end

  describe "without first_name" do
    it "should not be valid" do
      subject.first_name = nil
      subject.valid?.wont_equal true
    end
  end

  describe "full_name" do
    it "should cat first and last name" do
      subject.full_name.must_equal 'foo bar'
    end
  end
end
