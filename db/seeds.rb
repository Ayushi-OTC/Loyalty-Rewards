client = Client.create(name: "Earlydoc", email: "earlydoc@gmail.com")

standard_user = User.create(name: "Standard User", email: "standard@gmail.com", loyalty_type: "Standard", date_of_birth:(Time.now-18.years))

gold_user = User.create(name: "Gold User", email: "gold@gmail.com", loyalty_type: "Gold", date_of_birth:(Time.now-18.years))

platinum_user = User.create(name: "Platinum User", email: "platinum@gmail.com", loyalty_type: "Platinum", date_of_birth:(Time.now-18.years))

standerd_point = LoyaltyPoints.create(earned_points: 0, user_id: standard_user.id, expiration_date: (Time.now+1.year), client_id: client.id)

gold_point = LoyaltyPoints.create(earned_points: 1000, user_id: gold_user.id, expiration_date: (Time.now+1.year), client_id: client.id)

platinum_point = LoyaltyPoints.create(earned_points: 5000, user_id: platinum_user.id, expiration_date: (Time.now+1.year), client_id: client.id)
