module IsotopeContacts
  class PhoneNumber < ::ActiveRecord::Base
    validates_presence_of :number
    validates_presence_of :name
    belongs_to :contact

    def to_s
      "#{name}: #{number}"
    end
  end
end
