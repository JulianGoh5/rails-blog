# frozen_string_literal: true

# Notes
# - index, create, new are all related to the Controller#Action as described after exec. the command 'bin/rails routes'
# - standard CRUD actions: index, show, new , edit, create, update and destroy
# - somehow the '@article' convention allows the controller to link into the views folder - '@foobar' is an instance variable of self, instance variables belong to a certain object

class ArticlesController < ApplicationController
  # URI /welcome/index(.:format)
  def index
    @articles = Article.all # Where does articles come from? Presumably the OG 'bin/rails routes'
  end

  # URI /articles/:id(.:format)
  def show
    @article = Article.find(params[:id])
  end

  # URI /articles/new
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params) # Initialises model 'Article' with params[:article]

    if @article.save
      redirect_to @article
    else
      render 'new', status: 422
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
        redirect_to @article
    else
      render 'edit', status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
