class Merchant < ApplicationRecord
	validates_presence_of :name

	has_many :items, dependent: :destroy
	has_many :invoices
	has_many :customers, through: :invoices
	has_many :invoice_items, through: :invoices
	has_many :invoice_items, through: :items
	has_many :transations, through: :invoices

	def self.revenue(merchant)
		joins(:invoices, :invoice_items)
	end
end
