def caesar_cipher(string)
   offset = 9 
   alphabet = Array("a".."z")
   encoder = Hash[alphabet.zip(alphabet.rotate(offset))]
   string.chars.map { |c| encoder.fetch(c, " ") }.join
 end







def caesar_decipher(string)
   offset = -9
   alphabet = Array("a".."z")
   decoder = Hash[alphabet.zip(alphabet.rotate(offset))]
   string.chars.map{ |c| decoder.fetch(c, " ") }.join
 end
