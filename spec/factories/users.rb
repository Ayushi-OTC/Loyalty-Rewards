FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    date_of_birth   { Date.today }
    created_at      { Date.today - 1.week }
    after :create do |user|
      create_list :user_client_transaction, 15, user: user
      create_list :loyalty_points, 30, earned_points: 1000, user: user
    end

    trait :standard_type_user do
      email           { Faker::Internet.email }
      name       { Faker::Name.name }
      loyalty_type    { 'Standard' }
    end

    trait :gold_type_user do
      email           { Faker::Internet.email }
      name       { Faker::Name.name }
      loyalty_type { 'Gold' }
    end

    trait :platinum_type_user do
      email           { Faker::Internet.email }
      name       { Faker::Name.name }
      loyalty_type { 'Platinum' }
    end
  end
end