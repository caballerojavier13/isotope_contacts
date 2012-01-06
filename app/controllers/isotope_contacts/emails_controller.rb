module IsotopeContacts
  class EmailsController < ApplicationController
    before_filter :load_contact

    def new
      @email = @contact.emails.new(params[:email])
    end

    def create
      @email = @contact.emails.new(params[:email])
      if @email.save
        flash[:notice] = "Email created successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:notice] = "There was a problem creating the email."
        render :new
      end
    end

    def edit
      @email = @contact.emails.find(params[:id])
    end

    def update
      @email = @contact.emails.find(params[:id])
      if @email.update_attributes(params[:email])
        flash[:notice] = "Email updated successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:notice] = "There was a problem updating the email."
        render :edit
      end
    end

    def destroy
      @email = @contact.emails.find(params[:id])
      if @email.destroy
        flash[:notice] = "Email was deleted successfully."
        redirect_to contact_path(@contact)
      else
        flash.now[:error] = "There was a problem deleting the email"
        redirect_to contact_path(@contact)
      end
    end

    protected
    def load_contact
      @contact = IsotopeContacts::Contact.find(params[:contact_id])
    end
  end
end
