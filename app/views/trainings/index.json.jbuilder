json.array!(@trainings) do |training|
  json.extract! training, :kms, :time, :date, :runner_id, :description, :comments
  json.url training_url(training, format: :json)
end
