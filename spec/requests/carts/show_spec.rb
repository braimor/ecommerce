require 'rails_helper'

RSpec.describe "Cart" do
  
  describe "show cart" do
    subject { cart } 

    let!(:user) { FactoryBot.create(:user) }
    let!(:cart) { user.cart }
  
    before do
      sign_in user
      get cart_path(cart)
    end
    it { expect(response).to have_http_status(200) }
  end
end
