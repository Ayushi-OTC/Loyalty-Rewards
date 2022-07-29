class LoyaltyPoints < ApplicationRecord
  belongs_to :user
  after_save :update_loyalty_type

  private

  def update_loyalty_type
    ::LoyaltyTypeUpdateService.new(self.earned_points, self.user)
  end
end
