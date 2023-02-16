class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:update]
  before_action :is_matching_current_user, only: [:edit]


  def index
    @users = User.all
    @user = current_user
    @book = @user.books.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(user_session)
    else
      render :edit
    end
  end


  def edit
    @user = User.find(current_user[:id])
  end


    # user削除機能　routes.rb user[:destroy]追加 user.editのコメントアウト解除
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to users_path
  # end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end

  end

  def is_matching_current_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user.id)
    end

  end




end
