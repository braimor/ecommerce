require 'rails_helper'

RSpec.describe "Update LineItems" do
      subject(:put_request) do
        sign_in user
        put line_item_path(line_item), params: params
      end

      let(:product) { FactoryBot.create(:product, :with_image, price: 120) }
      let(:user) { FactoryBot.create(:user) }
      let!(:line_item) { FactoryBot.create(:line_item, cart: user.cart, product: product, quantity: 2) }
      let(:params) do
        {
          line_item: {
            quantity: 3
          }
        }
    end

      it 'updates the LineItem record' do
        put_request

        expect(line_item.reload.quantity).to eq(params[:line_item][:quantity])
      end

      context 'with invalid params' do
        let(:params) do
          {
            line_item: {
              quantity: '',
            }
          }
        end

        include_examples 'have http_status', :bad_request
      end

      context 'with invalid params' do
        let(:params) do
          {
            line_item: {
              quantity: '-2',
            }
          }
        end

        include_examples 'have http_status', :bad_request
      end

      context 'when not being signed in' do
        subject(:not_signed_in) do
          put line_item_path(line_item), params: params
        end

        let(:params) do
          {
            line_item: {
              quantity: '2'
            }
          }
        end

        include_examples 'not signed in examples'
      end

      context 'when being signed in' do
        it 'checks the http status of the request' do
          put_request

          expect(response).to have_http_status(302)
        end
      end
  end
