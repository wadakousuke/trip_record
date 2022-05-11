class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|

      t.timestamps
      t.references :post, foreign_key: true, :null => false
      t.integer :image_id, :null => false
    end
  end
end
