json.array!(@sale_details) do |sale_detail|
  json.extract! sale_detail, :id, :sale_id, :product_id, :importetotal, :preciounitario, :cantidad, :descuento
  json.url sale_detail_url(sale_detail, format: :json)
end
