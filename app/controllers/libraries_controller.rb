class LibrariesController < ApplicationController
  def index
  	@libraries = Library.all

  	respond_to do |f|
  		f.html
  		f.json { 
  			render json: @libraries.to_json(
	  			include: [
	  				adventures: {
	  					include: [:pages]
	  				}
	  			]
  			)
  		}
  	end
  end
end
