class GameInquiry < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :platform, presence: true
  validates :production_company, presence: true
  validates :introduction, presence: true
end
