FactoryGirl.define do
  factory :runner do
  	sequence(:name) { |i| "Nombre#{i}" }
    sequence(:email) { |i| "runner#{i}@gmail.com" }
    bio 'Crack keniata'
    datebirth '1976-11-12'
    country 'Kenya'
    password 'f4k3p455w0rd'

    factory :runner_with_shoes do
  	  ignore do
        shoes_count 3
      end
      after(:create) do |runner, evaluator|
        create_list(:shoe, evaluator.shoes_count, runner: runner)
      end
    end
  end  
end