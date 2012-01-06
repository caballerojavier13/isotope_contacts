module IsotopeContacts
  class ContactsController < ApplicationController
    def index
      @contacts = ::IsotopeContacts::Contact.all
    end

    def new
      @contact = ::IsotopeContacts::Contact.new(params[:contact])
    end

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

    def destroy
      @contact = ::IsotopeContacts::Contact.find(params[:id])
      if @contact.destroy
        flash[:notice] = "Contact was deleted successfully."
        redirect_to contacts_path
      else
        flash[:error] = "There was a problem deleting the contact"
        redirect_to contacts_path
      end
    end
  end
end
