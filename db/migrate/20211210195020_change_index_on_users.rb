class ChangeIndexOnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :email
    add_index :users, :name, unique: true
  end
end
