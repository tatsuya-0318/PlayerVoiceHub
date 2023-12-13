class GameWork < ApplicationRecord
  has_many :reviews
  has_many :game_work_bookmarks
  belongs_to :genre
  belongs_to :platform_genre
end
