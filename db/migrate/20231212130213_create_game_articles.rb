class CreateGameArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :game_articles do |t|
      t.string :title, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
