# frozen_string_literal: true

class Movie < ApplicationRecord
  include Slugged.new(source: :title)

  has_and_belongs_to_many :genres

  validates :title, :plot, presence: true
end
