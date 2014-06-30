class Product < ActiveRecord::Base
	has_many :saleDetails
	has_many :orderDetails
	has_one :category


	validates :nombre, presence: {message: "Es necesario llenar este campo"}
	validates :cantidad, presence: {message: "Es necesario llenar este campo"}
	validates :precio, presence: {message: "Es necesario llenar este campo"}
	
	def self.search(search)
      if search
        where('nombre LIKE ?', "%#{search}%")
      else
        scoped
    end
  end
end
