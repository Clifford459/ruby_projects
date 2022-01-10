class Encoder
  def encoder(string, offset)
    alphabet = Array("a".."z")
    encoder = Hash[alphabet.zip(alphabet.rotate(offset))]
    string.chars.map { |c| encoder.fetch(c, " ") }.join
  end
  def decoder(string, offset)
    encoder(string, offset * -1)
  end
end
