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
    if admin?
      @movie = Movie.new
      @movie.build_genre
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def create #done
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit #done
    @movie = Movie.find_by_id(params[:id])
    if @movie && admin?
      
    else
      redirect_to movies_path, alert: "Movie not found."
    end
  end

  def update #done
    @movie = Movie.find_by_id(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy #done
    @movie = Movie.find_by_id(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :synopsis, genre_attributes: [:name])
  end
end
