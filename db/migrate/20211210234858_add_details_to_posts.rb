class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :header, :string
    add_column :posts, :review, :integer
  end
end
