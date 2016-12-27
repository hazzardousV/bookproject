class AuthorSessionsController < ApplicationController
	def new
	end

	def create
		if login(params[:email], params[:password])
			redirect_back_or_to(books_path, notice: 'logged in succesfully')
		else
			flash.now.alert = "you don't belong here."
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:books, notice: 'Logged Out!')
	end
end
