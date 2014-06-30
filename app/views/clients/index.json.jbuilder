json.array!(@clients) do |client|
  json.extract! client, :id, :rfc, :nombre, :apellidos, :telefono, :direccion, :facebook, :lynkedin, :email
  json.url client_url(client, format: :json)
end
