class CreateSubComments < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_comments do |t|
      t.references :comment, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
