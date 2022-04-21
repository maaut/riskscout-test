class Discount
  attr_accessor :rule_name, :discount_price

  def initialize(rule_name, discount_price)
    @rule_name = rule_name
    @discount_price = discount_price
  end
end
