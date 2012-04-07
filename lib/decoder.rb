# http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener
class Decoder
  def initialize(hash)
    @hash = hash
  end

  def decode
    sum = 0
    @hash.split('').map do |chunk|
      Encoder::CHARS.index(chunk)
    end.reverse.each_with_index do |chunk, i|
      sum += chunk * Encoder::BASE ** i
    end

    sum
  end
end
