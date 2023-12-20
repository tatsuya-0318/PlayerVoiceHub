class CreateGameWorkBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :game_work_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_work, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
