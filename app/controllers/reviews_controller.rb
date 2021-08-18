class ReviewsController < ApplicationController
  before_action :redirect_if_not_signed_in?

  def index #done
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews
    else
      redirect_to movies_path, alert: "Movie not found."
    end
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
      @movie = @review.movie
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
    @review = Review.find_by_id(params[:id])
    if @review == nil
      redirect_to movies_path, alert: "Movie not found."
    elsif the_review_exists && current_user == @review.user || admin?

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
