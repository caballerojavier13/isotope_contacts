module IsotopeContacts
  class Contact < ActiveRecord::Base
    set_table_name "isotope_contacts_contacts"
    validates_presence_of :first_name

    def full_name
      [first_name, last_name].join(" ")
    end

    def to_s
      full_name
    end
  end
end
