module BooksHelper
	def book_params
		params.require(:book).permit(:title, :author, :body, :reader_list)
	end
end
