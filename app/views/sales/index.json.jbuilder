json.array!(@sales) do |sale|
  json.extract! sale, :id, :usuario_id, :fecha, :client_id, :importetotal
  json.url sale_url(sale, format: :json)
end
