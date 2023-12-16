class Genre < ApplicationRecord
  has_many :game_works, dependent: :destroy
  
  validates :name, presence: true
  
end
