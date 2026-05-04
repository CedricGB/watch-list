class Movie < ApplicationRecord
  validates :title, :overview, :poster_url, presence: true
  validates :title, length: { minimum: 2 }
end
