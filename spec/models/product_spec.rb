require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations: " do 
    context "New product created" do
      it 'should save when all fields are present' do
        @category = Category.new
        @product = Product.new(
          name: "Wand",
          price: 30000,
          quantity: 300,
          category: @category
        )

        @product.save
        @product.errors.full_messages
        expect(@product.id).to be_present
      end
      it 'should not save when name is nil' do
        @category = Category.new
        @product = Product.new(
          name: nil,
          price: 30000,
          quantity: 300,
          category: @category
        )
        @product.save
        @product.errors.full_messages
        expect(@product.id).to be_nil
      end
      it 'should not save when price is nil' do
        @category = Category.new
        @product = Product.new(
          name: "Wand",
          price: nil,
          quantity: 300,
          category: @category
        )
        @product.save
        @product.errors.full_messages
        expect(@product.id).to be_nil
      end
      it 'should not save when quantity is nil' do
        @category = Category.new
        @product = Product.new(
          name: "Wand",
          price: 30000,
          quantity: nil,
          category: @category
        )
        @product.save
        @product.errors.full_messages
        expect(@product.id).to be_nil
      end
      it 'should not save when category is nil' do 
        @category = Category.new
        @product = Product.new(
          name: "Wand",
          price: 30000,
          quantity: 300,
          category: nil
        )
        @product.save
        @product.errors.full_messages
        expect(@product.id).to be_nil
      end
    end
  end
end
