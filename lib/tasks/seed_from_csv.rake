namespace :csv_import do
  desc "Seed customers.csv from db/csv_seeds to customers table"
  desc "Seed invoice_items.csv from db/csv_seeds to invoice_items table"
  desc "Seed items.csv from db/csv_seeds to items table"
  desc "Seed invoices.csv from db/csv_seeds to invoices table"
  desc "Seed merchants.csv from db/csv_seeds to merchants table"
  desc "Seed transactions.csv from db/csv_seeds to transactions table"

	task import_csv: :environment do
    require "csv"
    customers = CSV.read("db/csv_seeds/customers.csv")
    invoice_items = CSV.read("db/csv_seeds/invoice_items.csv")
    invoices = CSV.read("db/csv_seeds/invoices.csv")
    items = CSV.read("db/csv_seeds/items.csv")
    merchants = CSV.read("db/csv_seeds/merchants.csv")
    transactions = CSV.read("db/csv_seeds/transactions.csv")

    customers.each do |line|
      Customer.create(first_name: line[0], last_name: [1], created_at: [2], updated_at: [3])
    end
    puts("Customer File imported")

    invoice_items.each do |line|
      Customer.create(quantity: line[0], unit_price: [1], created_at: [2], updated_at: [3])
    end
    puts("Invoice_items File imported")

    invoices.each do |line|
      Customer.create(status: line[0], created_at: [1], updated_at: [2])
    end
    puts("Invoices File imported")

    items.each do |line|
      Customer.create(name: line[0], description: [1], unit_price: [2] created_at: [3], updated_at: [4])
    end
    puts("Items File imported")

    merchants.each do |line|
      Customer.create(name: line[0], created_at: [1], updated_at: [2])
    end
    puts("Merchants File imported")

    transactions.each do |line|
      Customer.create(credit_card_number: line[0], credit_card_expiration_date: [1], result: [2], created_at: [3], updated_at: [4])
    end
    puts("Transactions File imported")
  end
