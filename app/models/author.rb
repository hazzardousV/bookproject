class Author < ActiveRecord::Base
	has_many :taggings
	has_many :books, through: :taggings

	def to_s
		name
	end
end
