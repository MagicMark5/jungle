class Sale < ActiveRecord::Base
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
