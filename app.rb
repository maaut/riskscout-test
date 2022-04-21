require_relative "product"
require_relative "checkout"

class App
  attr_reader :products, :checkout

  def initialize
    @products = []
    @checkout = Checkout.new
  end

  def create_products
    add_product(Product.new("CH1", "Chai", 3.11))
    add_product(Product.new("AP1", "Apples", 6.00))
    add_product(Product.new("CF1", "Coffee", 11.23))
    add_product(Product.new("MK1", "Milk", 4.75))
  end

  def add_product(product)
    @products << product
  end

  def create_menu
    puts "Please select an option:"
    puts "1. Add product"
    puts "2. See Basket"
    puts "3. Checkout"
    puts "4. Quit"
    switch_menu(gets.chomp)
  end

  def switch_menu(option)
    case option
    when "1"
      puts "Please enter the product code:"
      product_code = gets.chomp
      product = @products.find { |product| product.code == product_code }
      if product != nil
        checkout.scan(Product.new(product.code, product.name, product.price))
      else
        puts "Product not found"
      end

      create_menu
    when "2"
      checkout.basket.to_s
      create_menu
    when "3"
      checkout.basket.to_s

      puts "Thanks for shopping!"
    when "4"
      puts "Goodbye!"
      exit
    else
      puts "Invalid option"
      create_menu
    end
  end
end
