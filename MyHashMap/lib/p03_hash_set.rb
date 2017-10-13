require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 4)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) #"a" vs 11231231321
    @count += 1 unless include?(key)
    if @count > num_buckets
      resize!
      self[key] << key.hash unless include?(key)
      @count += 1
    else
      self[key] << key.hash unless include?(key)
    end
  end

  def include?(key)
    self[key].any? { |el| el == key.hash }
  end

  def remove(key)
    if include?(key)
      self[key].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    key = num.hash % num_buckets
    @store[key]
  end

  def num_buckets
    @store.length
  end

  def resize!
    els = []
    @count = 0

    @store.each do |arr|
      arr.each do |el|
        els << el
      end
    end

    @store = Array.new(num_buckets * 2) { Array.new }
    els.each do |el|
      insert(el)
    end

  end

end
