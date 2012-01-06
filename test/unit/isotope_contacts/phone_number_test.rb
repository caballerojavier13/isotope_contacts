require 'minitest_helper'

describe IsotopeContacts::PhoneNumber do
  subject do
    IsotopeContacts::PhoneNumber.new number: '2055551212', name: 'Home'
  end

  describe "with valid attributes" do
    it "should be valid" do
      subject.valid?.must_equal true
    end
  end

  describe "without number" do
    it "should not be valid" do
      subject.number = nil
      subject.valid?.wont_equal true
    end
  end

  describe "without name" do
    it "should not be valid" do
      subject.name = nil
      subject.valid?.wont_equal true
    end
  end

  it 'should respond to to_s' do
    subject.to_s.must_equal "#{subject.name}: #{subject.number}"
  end
end
