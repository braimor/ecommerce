require 'rails_helper'

RSpec.describe Product, :type => :model do
    subject { product }

    let(:product) { FactoryBot.create(:product) }
    let(:line_items) { FactoryBot.create(:line_items) }

    it { is_expected.to have_many(:line_items) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:name) }

    describe '#image' do
        subject { product.image }
         
        let(:product) { FactoryBot.create(:product, :with_image) }
    
        it { is_expected.to be_attached }
    end
end
