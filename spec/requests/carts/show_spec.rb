require 'rails_helper'

RSpec.describe "Show Cart" do
    let(:user) { FactoryBot.create(:user) }
    let!(:cart) { user.cart }
    
    context 'when not being signed in' do
      subject(:get_request) do
        get cart_path(cart)
      end
  
      include_examples 'not signed in examples'
    end

    context 'when being signed in' do
      subject(:signed_in) do
        sign_in user
        get cart_path(cart)
      end

      include_examples 'signed in examples'
    end
end
