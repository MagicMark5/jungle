module SalesHelper
  #The helper modules in the helpers folder can be referenced anywhere, this one is used in the layout
  def active_sale?
    # inside the where clause we are actually writing SQL, since its Action Record, it needs two arguments since we use two ?'s
    Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", 
    Date.current, Date.current).any?
  end
end