class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
  
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
