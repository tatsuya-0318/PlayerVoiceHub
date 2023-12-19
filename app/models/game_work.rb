class GameWork < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :game_work_bookmarks
  belongs_to :genre
  belongs_to :platform_genre
  
  has_one_attached :game_work_image
  
  def get_game_work_image(width, height)
    if game_work_image.attached?
      game_work_image.variant(resize_to_limit: [width, height]).processed
    else
      # 画像がアタッチされていない場合の代替処理。例えば、
      # プレースホルダー画像のURLを返すか、または何も表示しない
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end
  
  def self.looks(search, word)
    if search == "partial_match"
      GameWork.where("title LIKE?","%#{word}%")
    else
      GameWork.all
    end
  end
  
  with_options presence: true do
   validates :title
   validates :introduction
   validates :game_work_image, presence: true
  end

end
