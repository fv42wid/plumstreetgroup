class AddPasswordToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :password, :string
  end
end
