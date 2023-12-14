class ChangeIsDeletedToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :is_deleted, :boolean, default: false
  end
end
