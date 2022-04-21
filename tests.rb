require_relative "app"
require_relative "app"

RSpec.describe App do
  describe "#checkout total price" do
    it "basket test 1" do
      app = App.new

      app.create_products
      checkout = app.checkout

      chai = app.products.find { |product| product.code == "CH1" }
      apples = app.products.find { |product| product.code == "AP1" }
      coffee = app.products.find { |product| product.code == "CF1" }
      milk = app.products.find { |product| product.code == "MK1" }

      checkout.scan(Product.new(chai.code, chai.name, chai.price))
      checkout.scan(Product.new(apples.code, apples.name, apples.price))
      checkout.scan(Product.new(coffee.code, coffee.name, coffee.price))
      checkout.scan(Product.new(milk.code, milk.name, milk.price))

      expect(checkout.basket.total.round(2)).to eq(20.34)
    end
    it "basket test 2" do
      app = App.new

      app.create_products
      checkout = app.checkout

      apples = app.products.find { |product| product.code == "AP1" }
      milk = app.products.find { |product| product.code == "MK1" }

      checkout.scan(Product.new(milk.code, milk.name, milk.price))

      checkout.scan(Product.new(apples.code, apples.name, apples.price))

      expect(checkout.basket.total.round(2)).to eq(10.75)
    end
    it "basket test 3" do
      app = App.new

      app.create_products
      checkout = app.checkout

      coffee = app.products.find { |product| product.code == "CF1" }

      checkout.scan(Product.new(coffee.code, coffee.name, coffee.price))
      checkout.scan(Product.new(coffee.code, coffee.name, coffee.price))
      checkout.scan(Product.new(coffee.code, coffee.name, coffee.price))
      checkout.scan(Product.new(coffee.code, coffee.name, coffee.price))

      expect(checkout.basket.total.round(2)).to eq(22.46)
    end
    it "basket test 4" do
      app = App.new

      app.create_products
      checkout = app.checkout

      chai = app.products.find { |product| product.code == "CH1" }
      apples = app.products.find { |product| product.code == "AP1" }

      checkout.scan(Product.new(apples.code, apples.name, apples.price))

      checkout.scan(Product.new(apples.code, apples.name, apples.price))
      checkout.scan(Product.new(chai.code, chai.name, chai.price))

      checkout.scan(Product.new(apples.code, apples.name, apples.price))

      expect(checkout.basket.total.round(2)).to eq(16.61)
    end
  end
end
