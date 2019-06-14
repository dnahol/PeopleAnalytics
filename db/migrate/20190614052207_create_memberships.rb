class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :house, index: true
      t.belongs_to :banner_person, index: true
      t.boolean :active, index: true
      t.string :hsid
      t.date :date_added
      t.date :date_left
      t.timestamps
    end
  end
end
