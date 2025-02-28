class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @books = @user.books
    @book = Book.new
  end

  def create_book
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:notice]="error"
      redirect_to books_path
    end
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:body, :title)
  end

end
