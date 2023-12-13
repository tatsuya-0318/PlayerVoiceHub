class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :game_article_bookmarks
  has_many :game_inquiries
  has_many :report_inquiries
  has_many :notifications
  has_many :comments
  has_many :reviews
  has_many :game_work_bookmarks
  
  enum sex: { male: 0, female: 1 }
end
