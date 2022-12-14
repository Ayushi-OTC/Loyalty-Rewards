require 'rails_helper'
require 'spec_helper'

RSpec.describe API::V1::LoyaltyPoints do
  let!(:standard_type_user)          { create(:user, :standard_type_user) }
  let!(:client)                    { standard_type_user.client_transactions.last.client }
  let!(:local_transaction_amount)    { standard_type_user.client_transactions.where(client_id: client.id, currency: standard_type_user.currency).sum(:amount).to_i }
  let!(:foreign_transaction_amount)  { standard_type_user.client_transactions.where(client_id: client.id).where.not(currency: [nil, standard_type_user.currency]).sum(:amount).to_i }
  let!(:current_points)              { standard_type_user.points.sum(:earned_points).to_i }

  describe 'POST /api/loyalty_points' do
    it 'allows client to issue loyalty point to end user, auto calculation based on users transaction amount with client' do
      contact_loyalty_points_endpoint(client, standard_type_user.id)
      expect(response).to be_successful
      expect(standard_type_user.points.sum(:earned_points).to_i).to eq((current_points + (local_transaction_amount * 0.1) + (foreign_transaction_amount * 0.2)).to_i)
    end
  end

  private

  def contact_loyalty_points_endpoint(client, end_user_id)
    post "/api/loyalty_points", params: {end_user_id: end_user_id}, headers: {'Authorization' => "#{client.authentication_token}"}
  end
end