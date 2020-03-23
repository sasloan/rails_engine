class Merchant < ApplicationRecord
	validates_presence_of :name

	has_many :items, dependent: :destroy
	has_many :invoices
	has_many :customers, through: :invoices
	has_many :invoice_items, through: :invoices
	has_many :invoice_items, through: :items
	has_many :transactions, through: :invoices

	def self.revenue(merchant)
		joins(:invoice_items, :transactions).select("#{merchant}, sum(invoice_items.quantity * invoice_items.unit_price) as revenue").group(:id).where("transactions.result = true").order('revenue desc')
	end
end
