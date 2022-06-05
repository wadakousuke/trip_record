class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.references :user, foreign_key: true, :null => false
      t.references :category, foreign_key: true, :null => false
      t.string :title, :null => false
      t.text :body, :null => false
      t.datetime :experience_at, :null => false
      t.string :address, :null => false
      t.integer :review, :null => false
      t.float :latitude
      t.float :longitude



    end
  end
end
