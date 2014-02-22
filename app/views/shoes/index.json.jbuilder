json.array!(@shoes) do |shoe|
  json.extract! shoe, :runner_id, :nombre, :totalkms
  json.url shoe_url(shoe, format: :json)
end
