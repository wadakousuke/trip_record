class CreateTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relations do |t|

      t.timestamps
       t.references :post, foreign_key: true, :null => false
      t.references :tag, foreign_key: true, :null => false
    end
  end
end
