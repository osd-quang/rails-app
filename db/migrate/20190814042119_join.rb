class Join < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :posts, :posts
  end
end
