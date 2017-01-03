class AuthorsController < ApplicationController
	include AuthorsHelper
	before_filter :require_login, except: [:new, :create]
	def show
		@author = Author.find(params[:id])
	end
	def index
		@authors= Author.all
	end
	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		flash.notice = "Tyler, you just fired '#{@author.name}'"
		redirect_to authors_path
	end
	def edit
		@author = Author.find(params[:id])
	end
	def update
		@author = Author.find(params[:id])
		@author.update(author_params)

		flash.notice = "Tyler, quit fucking with '#{@author.title}'"

		redirect_to author_path(@author)
	end
end
