namespace :csv_import do
  desc 'Import files to database tables'

	task import_csv: :environment do
    require "csv"

		Transaction.delete_all
 		InvoiceItem.delete_all
 		Invoice.delete_all
 		Item.delete_all
 		Merchant.delete_all
 		Customer.delete_all

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
      InvoiceItem.create(line.to_h)
    end
    puts("Invoice_items File imported")

    invoices.each do |line|
      Invoice.create(line.to_h)
    end
    puts("Invoices File imported")

    items.each do |line|
      Item.create(line.to_h)
    end
    puts("Items File imported")

    merchants.each do |line|
      Merchant.create(line.to_h)
    end
    puts("Merchants File imported")

    transactions.each do |line|
      Transaction.create(line.to_h])
    end
    puts("Transactions File imported")

		puts("All Files Imported Successfully!")
  end
end
