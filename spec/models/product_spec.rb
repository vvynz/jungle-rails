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
      @product = Product.new(name: nil)
      @product.save
    

      expect(@product).to_not be_valid
      # expect(@product.errors[:name].size).to eq(1)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(name: "food")
      @product = Product.new(price_cents: nil)
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.create(name: "food")
      @product = Product.new(quantity: nil)
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.new(category: nil)
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
