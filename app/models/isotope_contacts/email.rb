module IsotopeContacts
  class Email < ::ActiveRecord::Base
    validates_presence_of :email
    validates_presence_of :name
    belongs_to :contact

    def to_s
      "#{name}: #{email}"
    end
  end
end
