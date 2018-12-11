class ProductList
  attr_reader :products

  def initialize(products = {
    'coke' => { price: 80, quantity: 2 },
    'lemonade' => { price: 100, quantity: 5 },
    'beer' => { price: 300, quantity: 10 },
    'crisps' => { price: 50, quantity: 6 },
    'apple' => { price: 60, quantity: 10 },
    'chocolate' => { price: 90, quantity: 10 }
  })
  @products = products
  end
end