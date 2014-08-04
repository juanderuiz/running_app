FactoryGirl.define do
  factory :runner do
  	sequence(:name) { |i| "Nombre#{i}" }
    sequence(:email) { |i| "runner#{i}@gmail.com" }
    bio 'Crack keniata'
    sequence(:age) { |i| 20 + i }
    country 'Kenya'
    password 'f4k3p455w0rd'

    #association :shoe

    #factory :runner do
  	  #association :shoe
    #end
  end  
end