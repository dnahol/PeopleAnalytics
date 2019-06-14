class CreateAdvisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advisements do |t|
      t.date :date
      t.integer :units
    end
  end
end
