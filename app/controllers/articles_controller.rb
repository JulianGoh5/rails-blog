# frozen_string_literal: true

# Notes
# - index, create, new are all related to the Controller#Action as described after exec. the command 'bin/rails routes'
# - standard CRUD actions: index, show, new , edit, create, update and destroy
# - somehow the '@article' convention allows the controller to link into the views folder - '@foobar' is an instance variable of self, instance variables belong to a certain object


class ArticlesController < ApplicationController
  def index #URI /welcome/index(.:format)
    @articles = Article.all # Where does articles come from? Presumably the OG 'bin/rails routes'
  end

  def show #URI /articles/:id(.:format)
    @article = Article.find(params[:id])
  end

  def new # URI /articles/new
    @article = Article.new
   end 

  def create
    @article = Article.new(article_params) #Initialises model 'Article' with params[:article]

    if  @article.save
      redirect_to @article
    else 
      render 'new', status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end


