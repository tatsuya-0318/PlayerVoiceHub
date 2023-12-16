class GameArticle < ApplicationRecord
  has_many :game_article_bookmarks
  
  has_one_attached :game_article_image
  
  #def get_game_article_image(width, height)
    #unless game_article_image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #if File.exist?(file_path)
        #game_article_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      #end
    #end
    #if game_article_image.attached?
      #game_article_image.variant(resize_to_limit: [width, height]).processed
    #else
      #Rails.root.join('app/assets/images/no_image.jpg')
    #end
  #end
  
  def get_game_article_image(width, height)
    if game_article_image.attached?
      game_article_image.variant(resize_to_limit: [width, height]).processed
    else
      # 画像がアタッチされていない場合の代替処理。例えば、
      # プレースホルダー画像のURLを返すか、または何も表示しない
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end
  
  with_options presence: true do
   validates :title
   validates :introduction
   validates :game_article_image, presence: true
  end
 
end
