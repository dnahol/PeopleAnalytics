class CreateHandouts < ActiveRecord::Migration[5.1]
  def change
    create_table :handouts do |t|
      t.belongs_to :membership, index: true
      t.date :date
      t.integer :units
    end
  end
end
