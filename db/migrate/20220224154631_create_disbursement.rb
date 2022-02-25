class CreateDisbursement < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.integer :merchant_id
      t.datetime :due_to
      t.float :merchant_part
      t.float :sequra_part
      t.timestamps
    end
  end
end
