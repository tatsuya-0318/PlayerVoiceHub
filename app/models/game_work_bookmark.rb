class GameWorkBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :game_work
end
