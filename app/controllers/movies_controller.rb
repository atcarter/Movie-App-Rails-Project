class MoviesController < ApplicationController
  before_action :redirect_if_not_signed_in?

  def index
    @movies = Movie.all
  end

  def show
    if the_movie_exists
      @movie = Movie.find_by_id(params[:id])
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def year_asc
    @movies = Movie.order_by_year_asc
    render :index
  end

  def year_desc
    @movies = Movie.order_by_year_desc
    render :index
  end

  def new 
    if admin?
      @movie = Movie.new
      @movie.build_genre
    else
      redirect_to movies_path, alert: "Access denied."
    end
  end

  def create 
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit 
    @movie = Movie.find_by_id(params[:id])
    if @movie && admin?
      
    else
      redirect_to movies_path, alert: "Movie not found or access denied."
    end
  end

  def update 
    @movie = Movie.find_by_id(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy 
    @movie = Movie.find_by_id(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :synopsis, :genre_id, genre_attributes: [:name])
  end

  def the_movie_exists
    params[:id] && Movie.exists?(params[:id])
  end
end
