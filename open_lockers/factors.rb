def factors(n1, n2)
  all_factors    = {}
  (n1..n2).each do |n|
    factors      = []
    (1..Math.sqrt(n).floor).each do |i|
    remaining    = n % i
    if remaining == 0
      factors << i
      factors << n/i
    end
  end

  factors = factors.sort.uniq
  puts "factors of #{n}: #{factors.join(",")}"
  all_factors[n] = [factors]
end
end


  def open_lockers(n1, n2)
    puts "Open lockers: #{(n1..n2).select { |x| Math.sqrt(x) % 1 == 0 }}"
  end
