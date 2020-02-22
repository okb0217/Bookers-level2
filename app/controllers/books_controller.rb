class BooksController < ApplicationController
  before_action :authenticate_user!




    def create
    	@book=Book.new(book_params)
    	@book.user_id=current_user.id
 		if @book.save
 		flash[:notice] = "Book was successfully created."
 	  	redirect_to book_path(@book)
 		else
 		@books = Book.all
 		@user = current_user
 		render "users/show"
    	end
    end

    def index
    	@books=Book.all
      @user = current_user
      @book=Book.new

    end


    def show
      @book_new=Book.new
      @book=Book.find(params[:id])
      @user =@book.user
    end

    def edit
  	 @book=Book.find(params[:id])
      @user=current_user
      unless @user.id == @book.user.id
      redirect_to books_path
    end
    end

    def update
    	@book=Book.find(params[:id])
  		if @book.update(book_params)
  		flash[:notice] = "Book was successfully update."
  	  redirect_to book_path(@book)
  		else
      @user=current_user
  		render action: :edit
  		end
    end

    def destroy
  	book=Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
	end

private

  def book_params
  	params.require(:book).permit(:title, :body)

  end


end
