class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.image_url = params[:image_url]
    @photo.caption = params[:caption]
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.image_url = params[:image_url]
    @photo.caption = params[:caption]
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end
end
