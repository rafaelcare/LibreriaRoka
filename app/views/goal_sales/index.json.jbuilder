json.array!(@goal_sales) do |goal_sale|
  json.extract! goal_sale, :id, :usuario_id, :alcanzado, :fechainicio, :fechafin
  json.url goal_sale_url(goal_sale, format: :json)
end
