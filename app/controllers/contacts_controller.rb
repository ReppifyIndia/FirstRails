class ContactsController < ApplicationController

# default view 
  def index
    @contacts = Contact.all
  end

	def new
  		@contact = Contact.new
	end

	def edit
  		@contact = Contact.find(params[:id])
	end
	

		
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
		  redirect_to @contact
		else
		  # This line overrides the default rendering behavior, which
		  # would have been to render the "create" view.
		  render "new"
    	end
  	end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    @contact.update!(contact_params)
    redirect_to "index"
  end
 
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def contact_params
      params.require(:contact).permit(:name, :phone)
    end  
  

end
