class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find(current_user[:id])
  end
  
  
  
  
  
  
end
