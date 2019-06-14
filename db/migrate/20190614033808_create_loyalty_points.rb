class CreateLoyaltyPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :loyalty_points do |t|
      t.date :date, index: true
      t.integer :pts
    end
  end
end
