class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:update, :edit]


  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(user_session)
  end


  def edit
    @user = User.find(current_user[:id])
  end

  def destroy
    @user = User.find(current_user[:id])
    @user.destroy
    redirect_to
  end



  private

  def user_params
    params.require(:users).permit(:name, :image, :body)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end

  end

end
