class Review < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :game_work
end
