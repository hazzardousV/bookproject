class Book < ActiveRecord::Base
	has_many :taggings
	has_many :authors, through: :taggings
	def reader_list
		authors.join(", ")
	end
	def reader_list=(authors_string)
			author_names = authors_string.split(",").collect{|s| s.strip.downcase}.uniq
			new_or_found_authors = author_names.collect {|name| Author.find_or_create_by(name: name)}
			self.authors = new_or_found_authors
	end
end
