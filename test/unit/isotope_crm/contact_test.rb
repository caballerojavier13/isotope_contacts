require "minitest_helper"

describe IsotopeCRM::Contact do
  subject do
    IsotopeCRM::Contact.new first_name: 'foo', last_name: 'bar'
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
end
