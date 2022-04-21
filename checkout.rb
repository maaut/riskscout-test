require_relative "basket"
require_relative "discount"

class Checkout
  attr_accessor :basket

  def initialize
    @basket = Basket.new
  end

  def scan(item)
    @basket.add_product(item)
    case item.code
    when "AP1"
      @basket.check_discount(Discount.new("APPL", 1.50))
      @basket.check_discount(Discount.new("CHMK", 4.75))
    when "CF1"
      @basket.check_discount(Discount.new("BOGO", 11.23))
    when "MK1"
      @basket.check_discount(Discount.new("CHMK", 4.75))
    end

    puts self.basket.to_s
  end

  def clear_basket
    @basket.items = []
    @basket.total = 0
  end
end
