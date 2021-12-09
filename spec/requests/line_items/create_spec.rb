require 'rails_helper'

RSpec.describe "Create LineItems" do
    subject(:post_request) do
      sign_in user
      post line_items_path(product_id: product), params: params
    end

    let(:product) { FactoryBot.create(:product, :with_image, price: 120) }
    let(:user) { FactoryBot.create(:user) }
    let(:params) do
        {
          line_item: {
            quantity: 2,
          }
        }
    end
    let(:created_line_item) { LineItem.last }

    it 'creates the LineItem record' do
      expect {
        post_request
      }.to change(LineItem, :count).by(1)

      expect(created_line_item.quantity).to eq(2)
      expect(created_line_item.total).to eq(240)
      expect(created_line_item.cart).to eq(user.cart)
    end

    it 'tests http status' do
      post_request

      expect(response).to have_http_status(302)
    end
end
