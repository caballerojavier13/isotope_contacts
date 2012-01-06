module IsotopeCRM
  class Contact < ActiveRecord::Base
    set_table_name "isotope_crm_contacts"
    validates_presence_of :first_name
  end
end
