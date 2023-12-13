class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.time :last_accessed_at, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
