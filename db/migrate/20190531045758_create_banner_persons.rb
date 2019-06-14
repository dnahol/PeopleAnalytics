class CreateBannerPersons < ActiveRecord::Migration[5.1]
  def change
    create_table :banner_persons do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :image
    end
  end
end
