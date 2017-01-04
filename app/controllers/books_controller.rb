class BooksController < ApplicationController
	before_filter :require_login, except: [:index, :show]
	include BooksHelper
	def index
		@books = Book.all
	end
	def show
		@book = Book.find(params[:id])
	end
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.save
		flash.notice = "I hope '#{@book.title}' is as good as you say it is, Tyler"
		redirect_to book_path(@book)
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash.notice = "Tyler, you just burned '#{@book.title}'"
		redirect_to books_path
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		@book.update(book_params)

		flash.notice = "Tyler, quit fucking with '#{@book.title}'"

		redirect_to book_path(@book)
	end
end
