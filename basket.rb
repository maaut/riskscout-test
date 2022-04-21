class Basket
  attr_accessor :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def add_product(product)
    @items << product
    @total = @total + product.price
  end

  def check_discount(discount)
    case discount.rule_name
    when "APPL"
      if @items.filter { |item| item.code == "AP1" }.count >= 3
        apples = @items.filter { |item| item.code == "AP1" }
        apples.each { |item|
          if item.add_discount(discount)
            @total = @total - item.discount.discount_price
          end
        }
      end
    when "BOGO"
      coffes = @items.filter { |item| item.code == "CF1" }

      if coffes.count >= 2
        coffes.each_with_index { |coffee, index|
          if (index > 0 && index % 2 != 0)
            if coffee.discount == nil
              coffee.add_discount(discount)
              if coffee.add_discount(discount)
                @total = @total - coffee.discount.discount_price
              end
            end
          end
        }
      end
    when "CHMK"
      if @items.filter { |item| item.code == "CH1" }.count >= 1
        milk = @items.find { |item| item.code == "MK1" }
        if milk != nil
          if milk.add_discount(discount)
            @total = @total - discount.discount_price
          end
        end
      end
    end
  end

  def to_s
    puts "Item\t\tPrice"
    puts "----\t\t-----"

    @items.each { |item| puts item.to_s }
    puts "----------------------"
    puts "\t\t\$#{@total.round(2)}"
  end
end
