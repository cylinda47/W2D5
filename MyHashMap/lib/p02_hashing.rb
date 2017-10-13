class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return self.hash if !self.is_a?(Array)
    hash_code = 0

    if self.empty?
      hash_code = nil.hash
    else
    #until !self.is_a?(Array) [1.hash, 2.hash, ,3.hash ]
      self.each_with_index do |el, i| # [], 0
        if el.is_a?(Array)
          el.hash # el == Array
        else
          hash_code += el.hash * i.hash
        end
      end
    end

    hash_code
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a + ("A".."Z").to_a
    hash_code = 0
    self.split("").each_with_index do |el, i|
      el = alphabet.index(el)
      hash_code += el.hash * i.hash
    end
    hash_code
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    hash_code = 0
    self.each do |k, v|
      # if the key sym -> str
      hash_code += (k.hash + v.hash)
    end
    hash_code
  end
end
