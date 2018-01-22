class CommentsController < ApplicationController
    http_basic_authenticate_with name: "melany", password: "secret", except: [:destroy]

	def create
    @fantastic_book = FantasticBook.find(params[:fantastic_book_id])
    @comment = @fantastic_book.comments.create(comment_params)
    redirect_to fantastic_book_path(@fantastic_book)
  end
 
  def destroy
    @fantastic_book = FantasticBook.find(params[:fantastic_book_id])
    @comment = @fantastic_book.comments.find(params[:id])
    @comment.destroy
    redirect_to fantastic_book_path(@fantastic_book)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
