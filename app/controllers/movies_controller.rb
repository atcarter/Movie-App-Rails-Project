class MoviesController < ApplicationController
  before_action :redirect_if_not_signed_in?

  def index
    @movies = Movie.all
  end
end
