class ReviewsController < ApplicationController
  
  def index
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews
    else
      redirect_to movies_path, alert: "Movie not found."
  end

  def new
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def show
    if the_movie_exists
      @review = Review.find_by_id(params[:id])
    else
      render
    end
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to movie_review_path(@review.movie, @review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    if @review.valid?
      @review.update(review_params)
      redirect_to movie_review_path(@review.movie, @review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if @review
      @review.delete
    end
    redirect_to movie_reviews_path(@review.movie)
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :user_id, :rating, :content)
  end

  def the_movie_exists
    params[:movie_id] && Movie.exists?(params[:movie_id])
  end

  def the_review_exists
    params[:id] && Review.exists?(params[:id])
  end

end
