require 'rails_helper'

RSpec.describe "Show Order" do
    let(:product) { FactoryBot.create(:product, :with_image, price: 120) }
    let(:user) { FactoryBot.create(:user) }
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
        get order_path(order)
    end
    
    context 'when not being signed in' do
        subject(:not_signed_in) do
            sign_out user
            get order_path(order)
        end

        include_examples 'not signed in examples'
    end
   
    context 'when being signed in' do
        it 'checks the http status of the request' do
            expect(response).to have_http_status(200)
        end
    end
end
