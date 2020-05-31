class PostPhotosController < ApplicationController
	before_action :ensure_correct_user, only: [:edit, :update]
  def index
  	@post_photos = PostPhoto.all.reverse_order
  	@post_photo = PostPhoto.new
  end

  def create
  	post_photo = current_user.post_photos.new(post_photos_params)
  	if post_photo.save
  		flash[:notice] = "投稿しました。"
  		redirect_to root_path
  	else
  		render 'index'
  	end
  end

  def show
  	@post_photo = PostPhoto.find(params[:id])
  end

  def edit
  	@post_photo = PostPhoto.find(params[:id])
  end

  def update
  	post_photo = PostPhoto.find(params[:id])
  	if post_photo.update(post_photos_params)
  		flash[:notice] = "編集内容が保存されました。"
  		redirect_to root_path
  	end
  end

  def destroy
  	post_photo = PostPhoto.find(params[:id])
  	if post_photo.destroy
  		flash[:notice] = "投稿を削除しました。"
  		redirect_to root_path
  	end
  end

  private
  def post_photos_params
  	params.require(:post_photo).permit(:user_id, :photo, :location, :caption)
  end

  def ensure_correct_user
  	post_photo = PostPhoto.find(params[:id])
  	if post_photo.user_id != current_user.id
  		redirect_to root_path
  	end
  end
end
