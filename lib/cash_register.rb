class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, amount, quantity = 1)
        self.last_transaction = amount * quantity
        self.total = self.total + amount * quantity
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - ((self.discount/100.0).to_f * self.total)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end

end

item1=CashRegister.new(20)
item1.add_item("chicken", 10, 2)
item1.apply_discount