require 'rails_helper'

RSpec.describe "Create Order" do

    let!(:user) { FactoryBot.create(:user) }
    let(:params) do
    {
      order: {
        user: user,
        address: 'Jacinto',
        phone: 03343432
      }
    }
    end

    before do
      sign_in user
      post orders_path(params: params)
    end

    it { expect(response).to have_http_status(302) }
end
