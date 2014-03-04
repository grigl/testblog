class IndexController < ApplicationController

  def index
    @new_post = Post.new
    @best_posts = Post.best_posts(10) 
    @categories_for_post_form = Category.all.map { |cat| [cat.name, cat.id] }
  end

  def search
    if params[:rating_from] && params[:rating_to] && params[:date_added]
      date = params[:date_added]
      rating_from = params[:rating_from].to_i
      rating_to = params[:rating_to].to_i
      @posts = Post.where('rating is not null').where('date_added = ?', date).where('rating >= ?', rating_from).where('rating <= ?', rating_to)
    else
      @posts = Post.none
    end

    render json: @posts
  end

  def search_authors
    if params[:author_ip]
      @authors = Post.where('author_ip = ?', params[:author_ip]).map {|post| post.author}.uniq
    else
      @authors = []
    end

    render json: @authors
  end
end