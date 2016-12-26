class Author < ActiveRecord::Base
	has_many :taggings
	has_many :books, through: :taggings
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	def to_s
		name
	end
	def book_list
		books.join(", ")
	end
	def book_list=(books_string)
			book_titles = books_string.split(",").collect{|s| s.strip.downcase}.uniq
			new_or_found_books = book_titles.collect {|title| Book.find_or_create_by(title: title)}
			self.books = new_or_found_books
	end
end
