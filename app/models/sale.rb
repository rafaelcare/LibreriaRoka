class Sale < ActiveRecord::Base
	belongs_to :client, :autosave => true
	has_one :user
	has_many :saleDetails, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :saleDetails
	has_many :products, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :products
end
