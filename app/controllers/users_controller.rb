class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @books = @user.books
  end

end
