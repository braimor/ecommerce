require 'rails_helper'

RSpec.describe Order, :type => :model do
    subject { order }

    let(:order) { FactoryBot.create(:order) }
    let!(:order_item) { FactoryBot.create_list(:order_item, 2, order: order, quantity: 1, price: 40) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:order_items) }

    describe '#calculate_total' do
        subject { order.calculate_total }
        
        it "Calculate total" do
            subject
            expect(order.total).to eq(80)
        end
    end
end
