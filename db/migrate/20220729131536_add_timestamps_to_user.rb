class AddTimestampsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :created_at, :datetime, null: false, default: Date.today
    add_column :users, :updated_at, :datetime, null: false, default: Date.today
  end
end
