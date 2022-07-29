class LoyaltyTypeUpdateService

  attr_reader :points
  attr_accessor :user

  def initialize(points, user)
    @points = points
    @user = user
  end

  def run
    user.update(loyalty_type: current_loyalty_type) if user.loyalty_type != current_loyalty_type
  end

  private

  def current_loyalty_type
    if points < 1000
      'standard'
    elsif points >= 1000 && points < 5000
      'gold'
    elsif points >= 5000
      'platinum'
    end
  end
end
