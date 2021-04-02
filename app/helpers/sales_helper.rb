module SalesHelper
  #The helper modules in the helpers folder can be referenced anywhere, this one is used in the layout
  def active_sale?
    # Here we reference the custom active method in our Sale Model in sale.rb, and chain an any? SQL AR method
    Sale.active.any?
  end

  def sale_name
    Sale.get_sale.name
  end

  def sale_percent_off
    Sale.get_sale.percent_off
  end


end