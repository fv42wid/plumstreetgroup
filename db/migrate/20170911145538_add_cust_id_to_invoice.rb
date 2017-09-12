class AddCustIdToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :customer_id, :integer
    remove_column :invoices, :customer_name
    remove_column :invoices, :customer_email
  end
end
