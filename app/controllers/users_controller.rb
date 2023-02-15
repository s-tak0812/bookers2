class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:update, :edit]


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


  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end

  end

end
