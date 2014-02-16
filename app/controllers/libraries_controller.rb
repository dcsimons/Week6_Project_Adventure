class LibrariesController < ApplicationController
  def home
  	render :home
  end

  def index
  	@libraries = Library.all

  	respond_to do |f|
  		f.html
  		f.json { 
  			render json: { 
  				libraries: @libraries.as_json(
		  			include: [
		  				adventures: {
		  					include: [:pages]
		  				}
		  			]
	  			)
	  		}
  		}
  	end
  end

  def create
  	library_params = params.require(:library).permit(:name, :url)
  	LibraryWorker.perform_async(library_params)
  	redirect_to libraries_path
  end

end
