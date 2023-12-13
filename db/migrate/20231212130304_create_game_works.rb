class CreateGameWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :game_works do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :platform_genre, null: false, foreign_key: true
      t.string :title, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
