# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @genres = Genre.order(name: :asc)
    @movies = movies_scope.includes(:genres).page(params[:page])
  end

  def show
    @movie = Movie.find_by(slug: params[:id])
  end

  private

  def movies_scope
    @current_genre = Genre.find_by(slug: params[:genre_slug])
    if @current_genre
      @current_genre.movies
    else
      Movie.all
    end
  end
end
