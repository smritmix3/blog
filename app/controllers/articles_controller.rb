class ArticlesController < ApplicationController
 def index
 @articles= Article.all
 end

 def new
 @article=Article.new
 end


 def create
 	@article=Article.new(params[:article].permit(:title, :body))
 	if @article.save
 		redirect_to "articles", notice: "Sucessfully created article"
 	else
 		render action: "new"
 	end
 end

	def show
	@article=Article.find(params[:id])
	end

	def edit
		@article=Article.find(params[:id])
	end

	def update
		@article= Article.find(params[:id])
		if @article.update_attributes(params[:article].permit(:title, :body))
	 	
	 		redirect_to "article", notice: "Sucessfully created article"
	 	else
	 		render action: "new"
	 	end
	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		redirect_to article , notice: "Sucessfully deleted"
	end

end
