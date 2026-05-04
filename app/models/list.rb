class List < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  has_many :bookmarks
  has_many :movies, through: :bookmarks
end
