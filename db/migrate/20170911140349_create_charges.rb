class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.integer :invoice_id
      t.integer :customer_id
      t.integer :amount
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
