class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|

      t.timestamps
      t.references :post, foreign_key: true, :null => false
      t.integer :image_id, :null => false
      t.index ["post_id"], name: "index_post_images_on_post_id"
    end
  end
end
