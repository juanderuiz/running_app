FactoryGirl.define do
  factory :shoe do
  	nombre "Adidas Supernova"
    totalkms '555'
    association :runner
  end
end