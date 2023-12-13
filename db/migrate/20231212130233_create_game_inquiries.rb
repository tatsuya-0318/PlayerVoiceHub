class CreateGameInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :game_inquiries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :platform, null: false
      t.string :production_company, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
