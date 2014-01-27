json.array!(@runners) do |runner|
  json.extract! runner, :name, :email, :bio, :age, :country
  json.url runner_url(runner, format: :json)
end
