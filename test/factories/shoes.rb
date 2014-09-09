FactoryGirl.define do
  factory :shoe do
  	sequence(:nombre) { |i| "Adidas Supernova#{i}" }
    totalkms '555'
    runner
  end
end