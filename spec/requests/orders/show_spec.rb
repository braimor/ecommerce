require 'rails_helper'

RSpec.describe "Show Order" do
    let(:product) { FactoryBot.create(:product, :with_image, price: 120) }
    let(:user) { FactoryBot.create(:user) }
    let!(:cart) { FactoryBot.create(:cart, user: user) }
    let!(:order) { FactoryBot.create(:order, user: user) }
    
    context 'when not being signed in' do
        subject(:not_signed_in) do
            get order_path(order)
        end

        include_examples 'not signed in examples'
    end
   
    context 'when being signed in' do
        subject(:signed_in) do
            sign_in user
            get order_path(order)
        end

        include_examples 'signed in examples'
    end
end
