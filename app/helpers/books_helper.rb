module BooksHelper
	def book_params
		params.require(:book).permit(:title, :author, :body)
	end
end
