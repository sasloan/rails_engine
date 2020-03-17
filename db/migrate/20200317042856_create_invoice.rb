class CreateInvoice < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.boolean :status
      t.references :customer, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
    end
  end
end
