class FantasticBooksController < ApplicationController

    http_basic_authenticate_with name: "melany", password: "secret", except: [:index, :show]

	def index
		@fantastic_books = FantasticBook.all
    end

	def show
	    @fantastic_book = FantasticBook.find(params[:id])
	end

	def new
		@fantastic_book = FantasticBook.new
	end

	def edit
  		@fantastic_book = FantasticBook.find(params[:id])
	end

	def create
	   		@fantastic_book = FantasticBook.new(params.require(:fantastic_book).permit(:title, :text))
	 
	  	if @fantastic_book.save
	  		redirect_to @fantastic_book
	  	else 
	  		render 'new'
	  	end
	end

	def update
  		@fantastic_book = FantasticBook.find(params[:id])
 
  		if @fantastic_book.update(fantastic_book_params)
    		redirect_to @fantastic_book
  		else
    		render 'edit'
  		end
	end


	def destroy
	  @fantastic_book = FantasticBook.find(params[:id])
	  @fantastic_book.destroy
	 
	  redirect_to fantastic_books_path
	end

	private
	def fantastic_book_params
	     params.require(:fantastic_book).permit(:title, :text)
	end
end
