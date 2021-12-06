require 'rails_helper'

RSpec.describe "Products" do
  
  describe "show product by id" do
    let!(:product) { FactoryBot.create(:product, :with_image, name: 'Ipod', price: 120) }

    before { get product_path(product.id) }
    it { expect(response).to have_http_status(200) }
  end
end
