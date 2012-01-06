module IsotopeContacts
  class ContactsController < ApplicationController
    def create
      @contact = ::IsotopeContacts::Contact.new(params[:contact])
      if @contact.save
        flash[:notice] = "Contact created successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:notice] = "There was a problem creating the contact."
        render :new
      end
    end

    def show
      @contact = ::IsotopeContacts::Contact.find(params[:id])
    end
  end
end
