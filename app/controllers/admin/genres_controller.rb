class Admin::GenresController < ApplicationController

 def index
  @genre = Genre.new
 end
 
 def edit
  @genre = Genre.find(params[:id])
 end
 
 def create
 end
 
 def update
 end
end


