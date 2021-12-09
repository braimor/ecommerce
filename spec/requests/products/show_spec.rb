require 'rails_helper'

RSpec.describe "Show Products" do
  
    let!(:product) { FactoryBot.create(:product, :with_image, price: 120) }

    before { get product_path(product.id) }
    
    it { expect(response).to have_http_status(200) }
end
