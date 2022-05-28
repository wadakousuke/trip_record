class RenameImageIdColumnToImage < ActiveRecord::Migration[6.1]
  def change
    change_column :images, :image_id, :text
  end
end
