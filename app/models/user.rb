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
  has_many :reviews, dependent: :destroy
  has_many :game_work_bookmarks
  
  validates :name, presence: true
  validates :age, presence: true
  #validates :sex, presence: true
  
  
  
  enum sex: { male: 0, female: 1 }
  
  before_validation :sex_validate
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.age = 20
      user.sex = 0
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  private
  
  def sex_validate
    if sex.nil?
      errors.add(:sex, 'は必ず選択してください')
    elsif !User.sexes.keys.include?(self.sex)
      errors.add(:sex, 'は不正な値です')
    end
  end
end
