class PagesController < ApplicationController
  def new
  end

  def show
  	@page = Page.find(params[:id])
  end

  def edit
  end
end
