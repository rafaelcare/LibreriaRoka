json.array!(@products) do |product|
  json.extract! product, :id, :isbn, :nombre, :cantidad, :precio, :category_id
  json.url product_url(product, format: :json)
end
