class GameArticle < ApplicationRecord
  has_many :game_article_bookmarks
  
  has_one_attached :image
  
  def get_game_article_image(width, height)
    unless game_article_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      game_article_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    game_article_image.variant(resize_to_limit: [width, height]).processed
  end
  
  with_options presence: true do
   validates :title
   validates :introduction
   validates :image
 end
 
end
