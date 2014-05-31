class PhotosController < ApplicationController
  before_action(:set_photo, :only => [:show, :edit, :destroy, :update])

  before_action(:signed_in_user_must_be_owner, :only => [:edit, :destroy, :update])


  def search
    @keyword = params[:keyword]

    @photos = Photo.where("caption LIKE '%#{@keyword}%'")

    render 'index'
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def signed_in_user_must_be_owner
    if @photo.user_id != current_user.id
      redirect_to root_url, :notice => "Nice try, suckah"
    end
  end

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.image = params[:image]
    @photo.caption = params[:caption]
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
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
    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end

  def my_wall
    @photos = current_user.own_photos
    render 'index'
  end

  def my_favorites
    @photos = current_user.favorite_photos
    render 'index'
  end


  def my_timeline
    @photos = current_user.timeline.order("created_at")
    render 'index'
  end










end
