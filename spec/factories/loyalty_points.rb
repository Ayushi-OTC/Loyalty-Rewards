FactoryBot.define do

  factory :loyalty_points, class: LoyaltyPoints do
    created_at  { Date.today + 1.week }
    expiration_date { Date.today + 1.year }
    association :client_id, factory: :client
  end
end
