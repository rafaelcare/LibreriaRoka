class Order < ActiveRecord::Base
	belongs_to :client, :autosave => true	
	has_many :orderDetails, :autosave => true #La clase relacionada se llama: SaleDetail
	accepts_nested_attributes_for :orderDetails


	# habilitar cuando se integre el req usuarios::::: validates :usuario_id, presence: {message: "Es necesario llenar este campo"}
	#validates :client_id, presence: {message: "Es necesario llenar este campo"}
	validates :fechaPedido, presence: {message: "Es necesario llenar este campo"}
	validates :fechaEntrega, presence: {message: "Es necesario llenar este campo"}
	 validates :fechaRealEntrega, presence: {message:"Es necesario llenar este campo"}
	# It returns the articles whose t
end
