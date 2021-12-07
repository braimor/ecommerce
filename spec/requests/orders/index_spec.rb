require 'rails_helper'

RSpec.describe "Index Orders" do
  
    let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:cart) { FactoryBot.create(:cart, user: user) }
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
    let!(:order) { FactoryBot.create(:order, user: user) }

    before do
      sign_in user
      get orders_path(order)
    end
    
    it { expect(response).to have_http_status(200) }
end
