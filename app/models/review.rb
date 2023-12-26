class Review < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :game_work
  
  validates :title, presence: true
  validates :content, presence: true
  validates :star, presence: true
end
