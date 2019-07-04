class AddImageToHouses < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :image, :string
  end
end
