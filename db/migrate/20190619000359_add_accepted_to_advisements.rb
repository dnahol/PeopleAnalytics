class AddAcceptedToAdvisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advisements, :accepted, :decimal
  end
end
