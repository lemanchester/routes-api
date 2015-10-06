FactoryGirl.define do
  factory :map do
    name { Faker::Address.city }
  end

end
