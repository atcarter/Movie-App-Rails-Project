class ReviewsController < ApplicationController
  
  def index
    @movie = Movie.find_by_id(params[:movie_id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.find_by_id(params[:movie_id])
    @review = Review.new
  end

  def show
    @revie = Review.find_by_id(params[:id])
  end

  def create

  end


end
