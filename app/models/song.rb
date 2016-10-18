class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :artist
end
