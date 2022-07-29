class User < ApplicationRecord
  has_many :rewards
  has_many :points, foreign_key: "user_id", class_name: "LoyaltyPoints"
  has_many :client_transactions, foreign_key: "user_id", class_name: 'UserClientTransaction'

  validates :name, presence: true

  def authentication_token
    AuthenticationTokenGenerator.encode(self.email)
  end
end
