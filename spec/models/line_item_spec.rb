require 'rails_helper'

RSpec.describe LineItem, :type => :model do
    subject { line_item }

    let(:product) { FactoryBot.create(:product, name: 'Macbook Pro', price: 600) }
    let(:cart) { FactoryBot.create(:cart, total: line_item.total) }
    let(:line_item) { FactoryBot.create(:line_item, product: product, quantity: 2) }
    
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to validate_presence_of(:total) }

    describe 'callbacks' do
        it "Calculates total value" do
            expect(subject.total).to eq(1200)
            expect(cart.total).to eq(1200)
        end
    end
end
