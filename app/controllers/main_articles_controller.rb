class MainArticlesController < ApplicationController 
  
  def index
  	@articles = Article.all.order(created_at: :desc)
  end

  def show
  	@articles = Article.friendly.find(params[:id]) 
  	@author = Admin.where(:admin_id => @articles.admin_id)
  	@allarticles = Article.where.not(id: @articles.id).limit(3)
  end
end
