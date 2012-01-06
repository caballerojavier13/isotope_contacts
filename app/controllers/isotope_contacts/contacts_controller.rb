module IsotopeContacts
  class ContactsController < ApplicationController
    def index
      @search = ::IsotopeContacts::Contact.search(params[:search])
      @contacts = @search.all
    end

    def new
      @contact = ::IsotopeContacts::Contact.new(params[:contact])
    end

    def show
      @contact = ::IsotopeContacts::Contact.find(params[:id])
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

    def edit
      @contact = ::IsotopeContacts::Contact.find(params[:id])
    end

    def update
      @contact = ::IsotopeContacts::Contact.find(params[:id])
      if @contact.update_attributes(params[:contact])
        flash[:notice] = "Contact was updated successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:error] = "There was a problem updating the contact."
        render :edit
      end
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
