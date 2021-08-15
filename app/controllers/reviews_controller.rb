class ReviewsController < ApplicationController
  
  def index
    if params[:movie_id] && Movie.exists?(params[:movie_id])
      @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews
    else
      redirect_to movies_path, alert: "Movie not found."
  end

  def new
    if params[:movie_id] && Movie.exists?(params[:movie_id])
      @movie = Movie.find_by_id(params[:movie_id])
      @review = Review.new(movie_id: @movie)
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to movie_reviews_path(@review.movie)
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
      redirect_to 
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if @review
      @review.delete
    end
    redirect_to mov
  end

  private
  def review_params
    params.require(:review).permit(:movie_id, :user_id, :rating, :content)
  end

end
