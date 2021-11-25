require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
    subject { order_item }

    let(:product) { FactoryBot.create(:product) }
    let(:order) { FactoryBot.create(:order) }
    let!(:order_item) { FactoryBot.create(:order_item, order: order, quantity: 1, price: 40) }

    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:order) }

    describe '#total_order_item' do
        subject { order_item.total_order_item }
        
        it { is_expected.to eq(40) }
    end
end
