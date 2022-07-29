class CreateUserClientTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_client_transactions do |t|
      t.references :user, foreign_key: true, index: true
      t.references :client, foreign_key: true, index: true
      t.string :currency
      t.decimal :amount

      t.timestamps
    end
  end
end
