class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :latitude,:float, null: true
    change_column :posts, :longitude,:float, null: true
  end
end
