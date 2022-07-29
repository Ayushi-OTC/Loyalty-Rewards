require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model  do
  let!(:user)  { create(:user, name: "Standard User") }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  it "is valid with valid attributes" do 
    expect(user).to be_valid
  end

end
