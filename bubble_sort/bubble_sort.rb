def bubble_sort(array)
  i = 0
  n = array.length
  
  while i < n - 1 do
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        i = 0
          else
            i += 1
          end
       end
    return array
  end
