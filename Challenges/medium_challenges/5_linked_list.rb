class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :linked_list

  def initialize
    @linked_list = []
  end

  def self.from_a(arr)
    return SimpleLinkedList.new if arr.nil? || arr.empty?

    new_linked_list = SimpleLinkedList.new
    arr.reverse.each { |num| new_linked_list.push(num) }
    new_linked_list
  end

  def to_a
    return [] if linked_list.empty?

    arr = []
    @linked_list.each { |element| arr << element.datum }
    arr
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def size
    linked_list.size
  end

  def empty?
    linked_list.empty?
  end

  def push(element)
    linked_list.unshift(Element.new(element, linked_list[0]))
  end

  def peek
    return nil if linked_list.empty?
    linked_list[0].datum
  end

  def head
    linked_list[0]
  end

  def pop
    return nil if linked_list.empty?
    linked_list.shift.datum
  end
end
