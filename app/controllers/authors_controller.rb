class AuthorsController < ApplicationController
	
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
		@articles = @author.articles
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(authors_params) 
	if @author.save
		redirect_to @author
	else
		render :new, status: :unprocessable_entity
	end
end

	def edit
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find(params[:id])
	
	if @author.update(authors_params)
		redirect_to @author
	else
		render :edit, status: :unprocessable_entity
	end
end

	def destroy
		@author = Author.find(params[:id])
		@author.destroy

		redirect_to root_path, status: :see_other
	end

	private
	def authors_params
		params.require(:author).permit( :firstname, :lastname, :email)
	end
end
