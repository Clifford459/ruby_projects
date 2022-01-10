def fizz_buzz(n)
  (1..n).map do |num|
    if num % 3 == 0 && num % 5 == 0
      "Fizz_Buzz"
    elsif num % 3 == 0
        "Fizz"
     elsif num % 5 == 0
          "Buzz"
        else
          num
        end
      end
    end

