class GenresController < ApplicationController
  before_action :redirect_if_not_admin?

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def new #done
    @genre = Genre.new
  end

  def create #done
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def edit #done
    @genre = Genre.find_by_id(params[:id])
    if @genre
      
    else
      redirect_to genres_path, alert: "Genre not found."
    end
  end

  def update #done
    @genre = Genre.find_by_id(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end

  def destroy #done
    @genre = Genre.find_by_id(params[:id])
    @genre.destroy

    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
