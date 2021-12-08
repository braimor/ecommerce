require 'rails_helper'

RSpec.describe "Update LineItems" do
      subject(:put_request) do
        sign_in user
        put line_item_path(line_item), params: params
      end

      let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }
      let!(:user) { FactoryBot.create(:user) }
      let!(:cart) { FactoryBot.create(:cart) }
      let!(:line_item) { FactoryBot.create(:line_item, product: product, cart: cart, quantity: 2, total: 240) }
      let(:params) do
          {
            line_item: {
              product: product,
              cart: cart,
              quantity: 3,
              total: 360
            }
          }
      end

      it 'updates the LineItem record' do
        put_request

        expect(line_item.reload.quantity).to eq(params[:line_item][:quantity])
        expect(line_item.reload.total).to eq(params[:line_item][:total])
      end

      it 'tests http status' do
        put_request
  
        expect(response).to have_http_status(302)
      end
  end
