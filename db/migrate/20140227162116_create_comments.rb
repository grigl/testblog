class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :author_ip
      t.text :comment
      t.integer :post_rating

      t.timestamps
    end
  end
end
