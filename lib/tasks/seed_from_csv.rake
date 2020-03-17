namespace :csv_import do
  desc "Seed customers.csv from db/csv_seeds to customers table"
  desc "Seed invoice_items.csv from db/csv_seeds to invoice_items table"
  desc "Seed items.csv from db/csv_seeds to items table"
  desc "Seed invoices.csv from db/csv_seeds to invoices table"
  desc "Seed merchants.csv from db/csv_seeds to merchants table"
  desc "Seed transactions.csv from db/csv_seeds to transactions table"

	task import_csv: :environment do
    require "csv"
    customers = CSV.read("db/csv_seeds/customers.csv", headers: true)
    invoice_items = CSV.read("db/csv_seeds/invoice_items.csv", headers: true)
    invoices = CSV.read("db/csv_seeds/invoices.csv", headers: true)
    items = CSV.read("db/csv_seeds/items.csv", headers: true)
    merchants = CSV.read("db/csv_seeds/merchants.csv", headers: true)
    transactions = CSV.read("db/csv_seeds/transactions.csv", headers: true)

    customers.each do |line|
      Customer.create(first_name: line[1], last_name: line[2], created_at: line[3], updated_at: line[4])
    end
    puts("Customer File imported")

    invoice_items.each do |line|
      InvoiceItem.create(item_id: line[1], invoice_id: line[2], quantity: line[3], unit_price: line[4], created_at: line[5], updated_at: line[6])
    end
    puts("Invoice_items File imported")

    invoices.each do |line|
      Invoice.create(customer_id: line[1], merchant_id: line[2], status: line[3], created_at: line[4], updated_at: line[5])
    end
    puts("Invoices File imported")

    items.each do |line|
      Item.create(name: line[1], description: line[2], unit_price: line[3], merchant_id: line[4], created_at: line[5], updated_at: line[6])
    end
    puts("Items File imported")

    merchants.each do |line|
      Merchant.create(name: line[1], created_at: line[2], updated_at: line[3])
    end
    puts("Merchants File imported")

    transactions.each do |line|
      Transaction.create(invoice_id: line[1], credit_card_number: line[2], credit_card_expiration_date: line[3], result: line[4], created_at: line[5], updated_at: line[6])
    end
    puts("Transactions File imported")
  end
end
