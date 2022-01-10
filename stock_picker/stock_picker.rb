stock_picker = [17,3,6,9,15,8,6,1,10]


def stock_picker(value, index)
stock.each_with_index { |value,index| puts "Price for day #{index} is: #{value}" if value <= 17 }
stock.shift[0]
best_deal = []
stock.to_a.minmax


def stock_picker(value, index)
   best_deal = []
   stock.shift[0]
   stock.each_with_index { |value,index| print "#{index} => #{value}, " if index <= stock.length }
   print best_deal
 end









def stock_picker(trading_days)
  max_profit  = 0
  days        = [-1, -1]

  trading_days.each_with_index do |buy_value, buy_day|
    trading_days.slice(buy_day, trading_days.length - buy_day).each_with_index do |sell_value, sell_day|
      current_profit = sell_value - buy_value

      if current_profit > max_profit
        max_profit = current_profit
        days       = [buy_day, sell_day + buy_day]
      end
    end
  end
   
  return days
end

