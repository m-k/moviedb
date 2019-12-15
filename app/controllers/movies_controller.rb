# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page])
  end

  def show
    @movie = Movie.find_by(slug: params[:id])
  end
end
