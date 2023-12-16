class Admin::PlatformGenresController < ApplicationController

  def index
    @platform_genre = PlatformGenre.new
    @platform_genres = PlatformGenre.all
  end

  def create
    @platform_genre = PlatformGenre.new(platform_genre_params)
    @platform_genre.save
    redirect_to admin_platform_genres_path
  end

  def edit
    @platform_genre = PlatformGenre.find(params[:id])
  end

  def update
    @platform_genre=PlatformGenre.find(params[:id])
    @platform_genre.update(platform_genre_params)
    redirect_to admin_platform_genres_path
  end

private

  def platform_genre_params
     params.require(:platform_genre).permit(:name)
  end

end
