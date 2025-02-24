class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
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
    @book.save
    redirect_to books_path
    #if @book.save
      # 保存に成功した場合の処理
    #else
      #保存に失敗した場合の処理
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:body, :title)
  end

end
