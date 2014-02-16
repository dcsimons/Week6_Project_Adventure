class PagesController < ApplicationController
  def new
  end

  def show
  	@adventure = Adventure.find(params[:adventure_id])
  	@page = Page.find(params[:id])
  end

  def edit
  end
end
