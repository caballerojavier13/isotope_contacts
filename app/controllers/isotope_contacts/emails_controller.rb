module IsotopeContacts
  class EmailsController < ApplicationController
    inherit_resources
    belongs_to :contact, parent_class: Contact
  end
end
