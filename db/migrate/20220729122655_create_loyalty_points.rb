class CreateLoyaltyPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_points do |t|
      t.references :user, foreign_key: true, index: true
      t.references :client, foreign_key: true, index: true
      t.integer :earned_points
      t.date :expiration_date

      t.timestamps
    end
  end
end
