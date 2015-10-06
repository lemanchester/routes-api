FactoryGirl.define do
  factory :route do
    origin      { Faker::Address.state_abbr }
    destination { Faker::Address.state_abbr }
    distance    { Faker::Number.decimal(2) }
    map
  end

end
