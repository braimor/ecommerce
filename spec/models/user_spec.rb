require 'rails_helper'

RSpec.describe User, :type => :model do
    subject { user }

    let!(:user) { FactoryBot.create(:user) }
    
    it { is_expected.to have_one(:cart) }
    it { is_expected.to have_many(:orders) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }

    it "is valid with valid attributes" do
        expect(user).to be_valid
    end
end
