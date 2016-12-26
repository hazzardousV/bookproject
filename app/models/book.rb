class Book < ActiveRecord::Base
	has_many :taggings
	has_many :authors, through: :taggings
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	def reader_list
		authors.join(", ")
	end
	def reader_list=(authors_string)
			author_names = authors_string.split(",").collect{|s| s.strip.downcase}.uniq
			new_or_found_authors = author_names.collect {|name| Author.find_or_create_by(name: name)}
			self.authors = new_or_found_authors
	end
	def to_s
		title
	end
end
