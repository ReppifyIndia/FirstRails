module Api
  class ContactsController < Api::BaseController

    private

	def contact_params
		params.require(:contact).permit(:name, :phone)
	end  

	def query_params
		# this assumes that an album belongs to an artist and has an :artist_id
		# allowing us to filter by this
		params.permit(:name, :phone)
	end

  end
end