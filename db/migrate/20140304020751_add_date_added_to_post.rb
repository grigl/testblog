class AddDateAddedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :date_added, :date
    add_index :posts, :date_added
  end
end
