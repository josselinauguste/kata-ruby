class Basket < Array
  UNIT_PRICE = 8
  
  def get_price()
    reduce([[]]) {|a, b| lot(a, b)}
    .reduce([]) {|a, bs| a << bs.length * UNIT_PRICE * reduction_factor(bs.length)}
    .reduce(&:+)
  end
  
  private
  
  def reduction_factor(n)
    case n
      when 2 then 0.95
      when 3 then 0.90
      when 4 then 0.80
      when 5 then 0.75
      else 1
    end
  end
  
  def lot(lots, book)
    lot = lots.select {|l| !(l.include?(book))}.sort {|a, b| a.length <=> b.length}.first
    unless lot
      lot = []
      lots << lot
    end
    lot << book
    lots
  end
end