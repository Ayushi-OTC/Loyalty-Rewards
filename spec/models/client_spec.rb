require 'rails_helper'
require 'spec_helper'

RSpec.describe Client, type: :model  do
  let!(:client)  { create(:client, name: "Standard User") }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  it "is valid with valid attributes" do 
    expect(client).to be_valid
  end

end
