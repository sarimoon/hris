class ReligionsController < ApplicationController
  def index
    @religions = if params[:keywords]
	               Religion.where('name like ?', "%#{params[:keywords]}")
                 else
				   []
				 end
  end
end
