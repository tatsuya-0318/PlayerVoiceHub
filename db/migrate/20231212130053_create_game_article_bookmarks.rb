class CreateGameArticleBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :game_article_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
