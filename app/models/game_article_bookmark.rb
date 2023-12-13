class GameArticleBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :game_article
end
