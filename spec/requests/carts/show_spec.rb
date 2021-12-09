require 'rails_helper'

RSpec.describe "Show Cart" do
    subject { cart } 

    let(:user) { FactoryBot.create(:user) }
    let!(:cart) { user.cart }
  
    before do
      sign_in user
      get cart_path(cart)
    end
    
    it { expect(response).to have_http_status(200) }
end
