class AddPaidToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :paid, :boolean, :default => false
    add_column :invoices, :charge_id, :integer
  end
end
