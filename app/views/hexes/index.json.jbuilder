json.array!(@hexes) do |hex|
  json.extract! hex, :id, :description
  json.url hex_url(hex, format: :json)
end
