# frozen_string_literal: true

ActiveAdmin.register Movie do
  permit_params :title, :slug, :plot, :poster, :rating
  includes :genres

  controller do
    defaults finder: :find_by_slug
  end

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column(:genres) { |movie| movie.genres.map(&:name) }
    column(:plot) { |movie| movie.plot.truncate(120, separator: /\s/) }
    column :poster
    column :rating
    column :created_at
    actions
  end
end
