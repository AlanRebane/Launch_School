# 4. Circular Queue
=begin
A circular queue is a collection of objects stored in a buffer 
that is treated as though it is connected end-to-end in a circle. 
When an object is added to this circular queue, it is added to the 
position that immediately follows the most recently added object, 
while removing an object always removes the object that has been 
in the queue the longest.

This works as long as there are empty spots in the buffer. 
If the buffer becomes full, adding a new object to the queue 
requires getting rid of an existing object; with a circular queue, 
the object that has been in the queue the longest is discarded 
and replaced by the new object.

Assuming we have a circular queue with room for 3 objects, 
the circular queue looks and acts like this:

//see photo in LS folder//

Your task is to write a CircularQueue class that implements a 
circular queue for arbitrary objects. The class should obtain 
the buffer size with an argument provided to CircularQueue::new, 
and should provide the following methods:

enqueue to add an object to the queue
dequeue to remove (and return) the oldest object in the queue. 
It should return nil if the queue is empty.

You may assume that none of the values stored in the queue are 
nil (however, nil may be used to designate empty spots in the buffer).

The below code should display true 15 times.

hint: https://en.wikipedia.org/wiki/Circular_buffer
=end

class CircularQueue
  def initialize(size)
    @queue = Array.new(size)
    @queue_size = size

    @current_step = 0
    @last_step = 0
  end

  def enqueue(ele)
    
    if (self.queue[current_step] != nil && last_step == current_step)
      increment_last_step
    end

    self.queue[current_step] = ele
    
    increment_current_step
  end

  def dequeue
    return nil if empty?

    return_val = queue[last_step]

    self.queue[last_step] = nil

    increment_last_step

    return_val
  end

  private
  
  attr_accessor :queue, :current_step, :last_step
  attr_reader :queue_size

  def increment_current_step
    if current_step < (self.queue_size - 1)
      self.current_step += 1
    else
      self.current_step = 0
    end
  end

  def increment_last_step
    if last_step < (self.queue_size - 1)
      self.last_step += 1
    else
      self.last_step = 0
    end
  end

  def empty?
    queue.all?(nil)
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil
queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil