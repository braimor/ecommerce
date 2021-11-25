require 'rails_helper'

RSpec.describe Cart, :type => :model do
    subject { cart }

    let(:product) { FactoryBot.create(:product, name: 'Macbook Pro', price: 600) }
    let!(:line_item) { FactoryBot.create(:line_item, product: product, quantity: 2, cart: cart) }
    let(:cart) { FactoryBot.create(:cart) }

    it { is_expected.to have_many(:line_items) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:total) }

    describe '#update_total' do
        subject { cart.update_total }

        it "Update cart total" do
            subject
            expect(cart.total).to eq(1200)
        end
    end

    describe '#calculate_quantity' do
        subject { cart.calculate_quantity }
        
        it "Update cart total" do
            subject
            expect(cart.calculate_quantity).to eq(2)
        end
    end
end
