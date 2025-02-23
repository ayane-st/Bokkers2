class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user.id)
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @books = @user.books
  end

end
