# frozen_string_literal: true

require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get root_path
    assert_equal 200, status
  end

  test '#show' do
    movie = Movie.create!(
      title: 'Robocop', plot: 'cyberpunk action film', poster: 'https://exam.ple/img.jpg'
    )
    get movie_path(movie)
    assert_equal 200, status
  end
end
