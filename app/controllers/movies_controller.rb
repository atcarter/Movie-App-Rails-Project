class MoviesController < ApplicationController
  before_action :redirect_if_not_signed_in?

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def year_asc
    @movies = Movie.order_by_year_asc
    render :index
  end

  def year_desc
    @movies = Movie.order_by_year_desc
    render :index
  end

  def new #done
    if the_movie_exists
      @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      redirect_to movies_path, alert: "Movie not found."
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

  def movie_params
    params.require(:movie).permit(:title, :year, :synopsis, genre_attributes: [:name])
  end
end
