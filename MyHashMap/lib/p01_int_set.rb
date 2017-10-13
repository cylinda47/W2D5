class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  # MaxIntSet(4)
  # arr = [1,2,3]
  # mix = [false, true, true, true]

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @max)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].any? { |el| el == num }
  end

  #private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num = num % num_buckets
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    @count += 1 unless include?(num)
    if @count > num_buckets
      resize!
      self[num] << num unless include?(num)
      @count += 1
    else
      self[num] << num unless include?(num)
    end

  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].any? { |el| el == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num = num % num_buckets
    @store[num]
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
