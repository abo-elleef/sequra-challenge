class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :merchant_id
      t.integer :shopper_id
      t.float :amount
      t.datetime :completed_at
      t.timestamps
    end
  end
end
