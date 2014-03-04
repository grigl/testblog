class RenamePostPostToPostBody < ActiveRecord::Migration
  def change
    rename_column :posts, :post, :post_body
  end
end
