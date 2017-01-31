class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :only_author!, only: [:edit, :update, :destroy]

	def new
		@article = Article.new
	end
  
  def create
  	@article = Article.new(page_params)
  	@article.user = current_user
  	if @article.save
  		redirect_to article_path(@article)
  	else
  		render :new
  	end	
  end

  def edit
  end

  def update
  	if @article.update(page_params)
  		redirect_to article_path(@article)
  	else
  		render :edit
  	end
  end

  def show
  end

  def index
  	@articles = Article.all.page(params[:page]).per(10)
  end

  def destroy
  	if @article.destroy
  		redirect_to articles_path
  	else
  		redirect_to articles_path, flash: {error: 'Something went wrong'}
  	end
  end
	private

	def only_author!
		unless @article.user == current_user
			redirect_to articles_path, flash: {error: 'Only author can edit article'}
		end
	end

	def page_params
		params[:article].permit(:title, :description, :body, :photo)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end