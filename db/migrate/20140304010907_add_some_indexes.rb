class AddSomeIndexes < ActiveRecord::Migration
  def change
    add_index :posts, :category_id
    add_index :posts, :rating
    add_index :posts, :author
  end
end
