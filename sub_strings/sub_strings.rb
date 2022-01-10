def substrings(list, dictionary)
   substrings = Hash.new()
   dictionary.map do |element| if list.include?(element)
       substrings[element] = list.downcase.scan(element).length
  end
end
   return substrings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
