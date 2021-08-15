class ReviewsController < ApplicationController
  
  def index #done
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews
    else
      redirect_to movies_path, alert: "Movie not found."
  end

  def new #done
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def show #done
    if the_review_exists
      @review = Review.find_by_id(params[:id])
    else
      redirect_to movies_path, alert: "Review not found."
    end
  end

  def create #done
    @review = Review.new(review_params)

    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def edit #done
    if the_review_exists && logged_in?
      @review = Review.find_by_id(params[:id])
    else
      redirect_to movies_path
    end
  end

  def update #done
    @review = Review.find_by_id(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy #done
    @review = Review.find_by_id(params[:id])
    @movie = @review.movie
    @review.destroy

    redirect_to movie_reviews_path(@movie)
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
