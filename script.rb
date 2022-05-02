def stock_picker(stock_prices)
  arr = []
  stock_prices.each_with_index do |stock, index|
    arr[index] = []
    i = index + 1
    while i < (stock_prices.length) do
      if arr.dig(index, 0) == nil
        arr[index][0] = stock_prices[i] - stock
        arr[index][1] = i
      end
      if (stock_prices[i] - stock) > arr[index][0]
        arr[index][0] = stock_prices[i] - stock
        arr[index][1] = i
      end
      i += 1
    end
  end
  arr.delete([])

  answer = []
  arr.each_with_index do |candidate, index|
    if answer[0] == nil
      answer[0] = candidate[0]
      answer[1] = index
      answer[2] = candidate[1]
    end
    if candidate[0] > answer[0]
      answer[0] = candidate[0]
      answer[1] = index
      answer[2] = candidate[1]
    end
  end
  [answer[1], answer[2]]
end

p stock_picker([17,3,6,9,15,8,6,1,10])