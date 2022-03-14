require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # let(:category) { Category.new(:name => nil) }

    it 'is valid with a valid product' do
      @category = Category.create(name: "food")
      @product = Product.new(name: 'tangerine', price_cents: 50, quantity: 100, category_id: @category.id )

      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it 'is not valid without a name' do
      @category = Category.create(name: "food")
      # @product = Product.new(name: nil, price_cents: 50, quantity: 100, category: @category)
      @product = Product.new(name: nil)
    

      expect(@product).to_not be_valid
      expect(@product.errors[:name].size).to eq(1)
    end

    it 'is not valid without a price' do
      @product = Product.new(name: 'fried chicken', price_cents: nil, quantity: 100)

      expect(@product.price_cents).to_not be_present
      # expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      
    end

    it 'is not valid without a category' do
      
    end
  end
end
