class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.string :invoice_date
      t.string :emitter_company
      t.string :charged_company
      t.decimal :invoice_value
      t.string :emails

      t.timestamps
    end
  end
end
