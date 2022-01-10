require "./lib/encoder"

describe Encoder do
  describe "#encoder" do
    it "returns a value of a letter in the alphabet 3 places forward" do
      encoder = Encoder.new
      expect(encoder.encoder("a", 3)).to eql("d")
    end

    it "returns a value of a letter in the alphabet 4 places forward" do
      encoder = Encoder.new
      expect(encoder.encoder("a", 4)).to eql("e")
    end
  end

  describe "#decoder" do
    it "returns a value of a letter in the alphabet 3 places backward" do
      decoder = Encoder.new
      expect(decoder.decoder("d", 3)).to eql("a")
    end

    it "returns a value of a letter in the alphabet 4 places backward" do
      decoder = Encoder.new
      expect(decoder.decoder("e", 4)).to eql("a")
    end
  end
end
