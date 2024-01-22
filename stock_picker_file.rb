def stock_picker(arr = [17,3,6,9,15,8,6,1,10])
  max_val = 0
  days = [0,0]
  arr.each_with_index do |val1,i|
      arr.each_with_index do |val2,j|
              if i <= j then break end
              current_val = val1-val2
              if current_val > max_val
                              max_val = current_val
                              days = [j,i]
              end
      end
  end
  pp days
end
