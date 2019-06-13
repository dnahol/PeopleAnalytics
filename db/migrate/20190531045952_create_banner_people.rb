class CreateBannerPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :banner_people do |t|

      t.timestamps
    end
  end
end
