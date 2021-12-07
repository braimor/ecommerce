require 'rails_helper'

RSpec.describe "Create LineItems" do
  
    let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:cart) { FactoryBot.create(:cart) }
    let(:params) do
        {
          line_item: {
            product: product,
            cart: cart,
            quantity: 2,
            total: 240
          }
        }
    end

    before do
      sign_in user
      post line_items_path(product_id: product), params: params
    end

    it { expect(response).to have_http_status(302) }
    it { expect(params[:line_item]).to eq(product: product, cart: cart, quantity: 2, total: 240) }
end
