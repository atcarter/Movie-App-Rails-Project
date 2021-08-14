class ReviewsController < ApplicationController
  
  def index
    @movie = Movie.find_by_id(:movie_id)
    @reviews = Review.order_by_rating
  end

  def new
    @movie = Movie.find_by_id(:movie_id)
    @review = Review.new
  end

  def create
    
  end


end
