require "isotope_contacts/engine"
require 'haml'
require 'bootstrap-sass'
require 'formtastic-bootstrap'

Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

module IsotopeContacts
end
