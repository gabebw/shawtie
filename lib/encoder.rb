# http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener
class Encoder
  CHARS = ('a'..'z').to_a +
          ('A'..'Z').to_a +
          ('0'..'9').to_a
  BASE = CHARS.size

  def initialize(id)
    @id = id
  end

  def encode
    char_indexes.map { |index| CHARS[index] }.join
  end

  private

  def char_indexes
    id = @id
    digits = []
    while id > 0
      remainder = id % BASE
      digits << remainder
      id /= BASE
    end
    digits.reverse
  end
end
