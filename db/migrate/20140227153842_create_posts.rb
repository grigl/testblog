class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :author_ip
      t.text :post

      t.timestamps
    end
  end
end
