class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :likes
      t.belongs_to :blogger, foreign_key: true
      t.belongs_to :destination, foreign_key: true

      t.timestamps
    end
  end
end
