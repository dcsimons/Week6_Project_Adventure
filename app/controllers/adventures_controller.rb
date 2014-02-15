class AdventuresController < ApplicationController
  def index
  	@adventures = Adventure.all
  	render :index
  end	

  def new
  end

  def show
  end

  def edit
  end
end
