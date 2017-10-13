class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @list = []
  end

  def [](i)
    self.each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    # find a node that doesn't have a @prev
  end

  def last
    # find node that doesn't have a @next
  end

  def empty?
    @list.empty?
  end

  def get(key)
    @list.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    @list.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    if !include?(key)
      @list << Node.new(key, val)
      update(key, val)
    end
  end

  def update(key, val)
  end

  def remove(key)

  end

  def each

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
