require 'rails_helper'

RSpec.describe "Show Cart" do
    let(:user) { FactoryBot.create(:user) }
    let!(:cart) { user.cart }
  
    before do
      sign_in user
      get cart_path(cart)
    end
    
    context 'when not being signed in' do
      subject(:get_request) do
        sign_out user
        get cart_path(cart)
      end
  
      include_examples 'not signed in examples'
    end

    context 'when being signed in' do
      it 'checks the http status of the request' do
        expect(response).to have_http_status(200)
      end
    end
end
