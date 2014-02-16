class AdventuresController < ApplicationController
  def index
  	@library = Library.find_by_url(adventures_path)

    respond_to do |f|
      f.html
      f.json { 
      	render json: @library.to_json( 
	      	include: [ 
	      		adventures: { 
	      			include: [:pages] 
	      		} 
	      	] 
	      )
    	}
    end
  end	

  def new
  end

  def show
  	@adventure = Adventure.find(params[:id])
  end

  def edit
  end
end
