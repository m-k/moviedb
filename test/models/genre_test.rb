# frozen_string_literal: true

require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test 'validates presence of name' do
    genre = Genre.new
    assert_not genre.valid?
    assert_not_empty genre.errors[:name]
  end

  test 'validates uniquiness of name' do
    assert Genre.create(name: 'sci-fi')
    genre = Genre.new(name: 'sci-fi')
    assert_not genre.valid?
    assert_includes genre.errors[:name], 'has already been taken'
  end

  test 'saves valid record' do
    genre = Genre.new(name: 'Art')
    assert genre.valid?
    assert_empty genre.errors
  end

  test 'generates slug' do
    genre = Genre.new(name: 'Sci-fi')
    assert genre.save
    assert_equal 'sci-fi', genre.slug
  end
end
