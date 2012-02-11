require "isotope_contacts/engine"
require 'haml'
require 'bootstrap-sass'
require 'formtastic-bootstrap'
require 'meta_search'
require 'inherited_resources'

Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

module IsotopeContacts
end
