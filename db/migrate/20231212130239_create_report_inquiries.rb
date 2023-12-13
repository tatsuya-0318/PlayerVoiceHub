class CreateReportInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :report_inquiries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
