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
end
