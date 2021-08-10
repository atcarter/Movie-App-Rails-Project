class MoviesController < ApplicationController
  before_action :redirect_if_not_signed_in?

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end
end
