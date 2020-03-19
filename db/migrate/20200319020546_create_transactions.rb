class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.boolean :result

      t.timestamps
    end
  end
end
