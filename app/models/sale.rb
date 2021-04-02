class Sale < ActiveRecord::Base

  # inside the where clause we are actually writing SQL, since its Action Record, it needs two arguments since we use two ?'s
  #@@active_sale_query = "sales.starts_on <= ? AND sales.ends_on >= ?"

  # AR Scope - Class Methods (starting with self.), we can reference any methods we make here in our helpers
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
    #self.where is implied
  end

  def self.get_sale
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).first
  end

  # we can also do the above using scope and lambda ...
  # scope :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current) }


  # The public methods defined in this Sale Model will be available 
  # to each sale obj in the view partial
  # These are instance methods
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active? 
    !finished? && !upcoming?
  end

end
