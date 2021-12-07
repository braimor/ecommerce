require 'rails_helper'

RSpec.describe "Update LineItems" do
  
      let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }
      let!(:line_item) { FactoryBot.create(:line_item, quantity: 2, total: 240) }
      let!(:user) { FactoryBot.create(:user) }
      let!(:cart) { FactoryBot.create(:cart, user: user) }
      let(:params) do
          {
            line_item: {
              quantity: 3,
              total: 360
            }
          }
      end
  
      before { patch line_item_path(line_item), params: params }
      
      it { expect(response).to have_http_status(302) }
      it { expect(params[:line_item]).to eq(quantity: 3, total: 360) }
  end
