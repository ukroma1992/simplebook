class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where(availability: true)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
    authorize! :manage, @book
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Книга была успешно создана.'
    else
      render 'new'
    end
  end

  def update
    authorize! :manage, @book
    if @book.update(book_params)
      redirect_to @book, notice: 'Книга была успешно обновлена.'
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :manage, @book
    @book.destroy
    redirect_to books_url, notice: 'Книга была успешно удалена.'
  end

  private

    def set_book
      @book = Book.friendly.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author, :description, :price, :availability, :image, :resource)
    end
end
