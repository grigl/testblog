class RemoveAuthorIpFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :author_ip
  end
end
