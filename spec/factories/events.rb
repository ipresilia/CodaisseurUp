FactoryGirl.define do
  factory :event do
    name               "Name"
    description        { Faker::Lorem.sentence(40) }
    location           { Faker::Address.city }
    price              { Faker::Commerce.price }
    capacity           2
    includes_food      true
    includes_drinks    true
    starts_at          { Date.today - Faker::Number.number(3).to_i.days }
    ends_at            { Date.tomorrow - Faker::Number.number(3).to_i.days }
    user               { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
