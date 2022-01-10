def fizz_buzz(n)
   (1..n).map do |num|
     { [true, false] => "Fizz",
       [false, true] => "Buzz",
       [true, true] => "Fizz_Buzz"}
     [[num % 3 == 0, num % 5 == 0]] || num
   end
 end

