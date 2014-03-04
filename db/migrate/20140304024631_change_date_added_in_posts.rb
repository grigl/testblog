class ChangeDateAddedInPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :date_added
    add_column :posts, :date_added, :string
    add_index :posts, :date_added
  end
end
