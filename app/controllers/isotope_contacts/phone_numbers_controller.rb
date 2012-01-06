module IsotopeContacts
  class PhoneNumbersController < ApplicationController
    before_filter :load_contact

    def new
      @phone_number = IsotopeContacts::PhoneNumber.new(params[:phone_number])
    end

    def create
      @phone_number = IsotopeContacts::PhoneNumber.new(params[:phone_number])
      if @phone_number.save
        flash[:notice] = "Phone Number created successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:notice] = "There was a problem creating the phone number."
        render :new
      end
    end

    def edit
      @phone_number = @contact.phone_numbers.find(params[:id])
    end

    def update
      @phone_number = @contact.phone_numbers.find(params[:id])
      if @phone_number.update_attributes(params[:phone_number])
        flash[:notice] = "Phone Number updated successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:notice] = "There was a problem updating the phone number."
        render :edit
      end
    end

    def destroy
      @phone_number = @contact.phone_numbers.find(params[:id])
      if @phone_number.destroy
        flash[:notice] = "Phone Number was deleted successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:error] = "There was a problem deleting the phone number"
        redirect_to contact_path(@contact)
      end
    end

    protected
    def load_contact
      @contact = IsotopeContacts::Contact.find(params[:contact_id])
    end
  end
end
