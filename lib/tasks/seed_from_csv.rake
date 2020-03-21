namespace :import do
  desc 'Import files to database tables'
  task from_csv: :environment do
    require 'csv'
    system "rake db:reset > /dev/null"
    customers = CSV.read('db/csv_seeds/customers.csv', headers: true)
    invoice_items = CSV.read('db/csv_seeds/invoice_items.csv', headers: true)
    invoices = CSV.read('db/csv_seeds/invoices.csv', headers: true)
    items = CSV.read('db/csv_seeds/items.csv', headers: true)
    merchants = CSV.read('db/csv_seeds/merchants.csv', headers: true)
    transactions = CSV.read('db/csv_seeds/transactions.csv', headers: true)

    customers.each do |line|
      Customer.create(line.to_a[1..-1].to_h)
    end
    puts 'Customers Imported'

    merchants.each do |line|
      Merchant.create(line.to_a[1..-1].to_h)
    end
    puts 'Merchants Imported'

    items.each do |line|
      item = Item.new(line.to_a[1..-1].to_h)
      item.unit_price = item.unit_price / 100
      item.save
    end
    puts 'Items Imported'

    invoices.each do |line|
      Invoice.create(line.to_a[1..-1].to_h)
    end
    puts 'Invoices Imported'

    invoice_items.each do |line|
      invoice_item = InvoiceItem.new(line.to_a[1..-1].to_h)
      invoice_item.unit_price = invoice_item.unit_price / 100
      invoice_item.save
    end
    puts 'Invoice Items Imported'

    transactions.each do |line|
      Transaction.create(line.to_a[1..-1].to_h)
    end
    puts 'Transactions Imported'
    puts 'Import Complete.'
  end
end
