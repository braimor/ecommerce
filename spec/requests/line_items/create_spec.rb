require 'rails_helper'

RSpec.describe "Create LineItems" do
    subject(:post_request) do
      sign_in user
      post line_items_path(product_id: product), params: params
    end

    let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:cart) { FactoryBot.create(:cart) }
    let(:params) do
        {
          line_item: {
            quantity: 2,
            total: 240
          }
        }
    end

    it 'creates the LineItem record' do
      expect {
        post_request
      }.to change(LineItem, :count).by(1)
    end

    it 'tests http status' do
      post_request

      expect(response).to have_http_status(302)
    end
end
