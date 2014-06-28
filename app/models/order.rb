class Order < ActiveRecord::Base
<<<<<<< HEAD
	belongs_to :client, :autosave => true	
	has_many :orderDetails, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :orderDetails
=======
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
end
