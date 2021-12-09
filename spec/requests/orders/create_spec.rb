require 'rails_helper'

RSpec.describe "Create Order" do
    subject(:post_request) do
      sign_in user
      post orders_path(params: params)
    end

    let!(:user) { FactoryBot.create(:user) }
    let(:params) do
    {
      order: {
        address: 'Jacinto',
        phone: 03343432
      }
    }
    end
    let(:created_order) { Order.last }

    it 'creates the Order record' do
      expect {
        post_request
      }.to change(Order, :count).by(1)

      expect(created_order.address).to eq('Jacinto')
      expect(created_order.phone).to eq(03343432)
      expect(created_order.user).to eq(user)
    end

    it 'tests http status' do
      post_request

      expect(response).to have_http_status(302)
    end
end
