class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_work, null: false, foreign_key: true
      t.float :star, null: false
      t.text :content, null: false
      

      t.timestamps
    end
  end
end
