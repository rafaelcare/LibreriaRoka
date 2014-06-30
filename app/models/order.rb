class Order < ActiveRecord::Base
	belongs_to :client, :autosave => true	
	has_many :orderDetails, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :orderDetails
end
