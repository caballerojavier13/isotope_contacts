module IsotopeContacts
  class Contact < ActiveRecord::Base
    validates_presence_of :first_name
    has_many :phone_numbers
    has_many :emails

    def full_name
      [first_name, last_name].join(" ")
    end

    def to_s
      full_name
    end
  end
end
