class CashRegister
  def initialize
    @bills = []
  end

  def each(&block)
    @bills.each(&block)
  end

  def product_frequency
    result = {} 
    each { |bill| 
      bill.each { |position| 
        result[position.product] ||= 0 
        result[position.product] += position.quantity 
      } 
    } 
    result 
  end

  def << bill
    @bills << bill
    self
  end
end

class Bill
  attr_reader :positions,:nr
  protected :positions

  def initialize(nr)
    @nr = nr
    @positions = []
  end

  def each(&block)
    @positions.each(&block)
  end

  def << pos
    @positions << pos
    self
  end
end

class Position
  attr_reader :product,:quantity,:price
  def initialize(product,quantity,single_price)
    @product = product
    @quantity = quantity
    @price = single_price * quantity
  end
end  