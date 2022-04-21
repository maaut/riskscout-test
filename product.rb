class Product
  attr_accessor :code, :name, :price, :discount

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def add_discount(discount)
    # if (self.discount == nil || self.discount.rule_name != discount.rule_name)
    #   puts "\t#{discount.rule_name} \t -#{discount.discount_price}"
    self.discount = discount
    #   puts discount.rule_name
    return true
    # end
    # return false
  end

  def to_s
    "#{@code}\t\t\$#{@price}#{self.discount != nil ? "\n\t#{self.discount.rule_name}\t\$-#{self.discount.discount_price}" : ""}"
  end
end
