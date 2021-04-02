class Category < ActiveRecord::Base

  has_many :products

  # Returns the total number of products in this category
  def total_quantity
    category_quantity = 0 
    self.products.each do |product|
      category_quantity += product.quantity
    end
    category_quantity
  end

  # Returns the summed total value of all products in stock for this category
  def total_value
    category_value = 0 
    self.products.each do |product|
      category_value += (product.price * product.quantity)
    end
    category_value
  end
 
end
