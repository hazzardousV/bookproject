module AuthorsHelper
	def author_params
		params.require(:author).permit(:name, :title, :link, :book_list, :image)
	end
end
