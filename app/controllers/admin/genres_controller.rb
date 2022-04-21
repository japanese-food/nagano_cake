class Admin::GenresController < ApplicationController

 def index
  @genre = Genre.new
 end
 
 def edit
  @genre = Genre.find(params[:id])
 end
 
 def create
  @genre = Genre.new
  if @genre.save
   redirect_to admin_genres_path
  else
   render :index
  end
 end
 
 def update
  @genre = Genre.find(params[:id])
   if @genre.update
    redirect_to admin_genres_path
   else
    render :edit
   end
 end
 
 
 private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end


