require 'rails_helper'

RSpec.describe "Create LineItems" do
    subject(:post_request) do
      sign_in user
      post line_items_path(product_id: product.id), params: params
    end

    let(:product) { FactoryBot.create(:product, :with_image, price: 120) }
    let(:user) { FactoryBot.create(:user) }
    let(:params) do
        {
          line_item: {
            quantity: 2
          }
        }
    end
    let(:created_line_item) { LineItem.last }

    context 'when product lineitem exists but there aren`t params' do
        let(:product) { FactoryBot.create(:product) }
        let!(:product_line_item) { FactoryBot.create(:line_item, quantity: 1, product: product, cart: user.cart) }

        let(:params) do
          {
            line_item: {
              quantity: ''
            }
          }
        end

        it 'adds one to LineItem already created' do
          post_request
          expect(product_line_item.reload.quantity).to eq(2)
        end
    end

    context "when @product_line_item doesn`t exist neither do params" do
      
      it 'adds one to LineItem created' do
        sign_in user
        post line_items_path(product_id: product.id), params: {}
        expect(created_line_item.quantity).to eq(1)
      end
    end

    context 'when params[:line_item] exist' do

      context "and quantity isn`t present" do

        let(:params) do
          {
            line_item: {
              quantity: ''
            }
          }
        end

        it 'adds one to LineItem already created' do
          post_request
        end
        
        include_examples 'have http_status', :bad_request
      end

      context "and quantity is less than 0" do

        let(:params) do
          {
            line_item: {
              quantity: '-2'
            }
          }
        end

        it 'adds one to LineItem already created' do
          post_request
        end
        
        include_examples 'have http_status', :bad_request
      end

      context "and quantity is present" do

          it 'creates the LineItem record with params' do
          expect {
            post_request
          }.to change(LineItem, :count).by(1)

          expect(created_line_item.quantity).to eq(2)
          expect(created_line_item.total).to eq(240)
          expect(created_line_item.cart).to eq(user.cart)
        end
      end
      
    end

    context 'when not being signed in' do
      subject(:not_signed_in) do
        post line_items_path(product_id: product), params: params
      end

      include_examples 'not signed in examples'
    end

    context 'when being signed in' do
      it 'checks the http status of the request' do
        post_request
      end
      
      include_examples 'have http_status', 302
    end
end
