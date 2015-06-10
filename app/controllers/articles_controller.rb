class ArticlesController < ApplicationController
	
	#GET /articles
	def index
		#Todos los registros SELECT * FROM articles
		@articles = Article.all
	end

	#GET "/articles/:id"
	def show
		#Encuentre registro por id
		#Where
		@article = Article.find(params[:id])
	end
	#GET articles/new
	def new
		@article = Article.new
	end

	#POST /articles
	def create
		#INSERT TO
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Distroy elimina el objeto de la BD
		redirect_to articles_path
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end
end