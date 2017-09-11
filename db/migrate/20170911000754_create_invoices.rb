class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :customer_name
      t.string :customer_email
      t.integer :amount
      t.text :note

      t.timestamps
    end
  end
end
