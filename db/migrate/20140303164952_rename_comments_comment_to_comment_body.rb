class RenameCommentsCommentToCommentBody < ActiveRecord::Migration
  def change
    rename_column :comments, :comment, :comment_body
  end
end
