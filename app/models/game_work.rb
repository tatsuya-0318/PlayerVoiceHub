class GameWork < ApplicationRecord
  has_many :reviews
  has_many :game_work_bookmarks
  belongs_to :genre
  belongs_to :platform_genre
  
  has_one_attached :image
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
