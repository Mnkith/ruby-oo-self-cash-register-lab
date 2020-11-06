
class CashRegister

  def initialize(discount = 0)
    @total = 0
    @items = []
    @discount = discount
  end
  attr_accessor :total, :discount, :items
  attr_reader  :aggregate_price, :quantity

  def add_item(item, item_price = 0.0, quantity = 1)
    # @items.concat([item] * quantity) # concat will create new area
    # quantity.times  {@items << item }
    @items += [item] * quantity # I prefer this because it only uses primitive operators
    @quantity = quantity
    @aggregate_price = item_price * quantity
    self.total += @aggregate_price
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0 #check for zero before doing any further ops
    self.total = self.total - self.total / 100 * self.discount
    "After the discount, the total comes to $#{self.total}."
  end
  
  def void_last_transaction
    self.total -= self.aggregate_price
    quantity.times {self.items.pop} #<<this will update the items array accordingly although at the same time 
                                    #will expose the items array, private modifire would be more appropriate
  end

end