# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    raise TypeError.new "Can only add Todo objects" if task.class != Todo
    self.todos << task
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |task| task.done? }
  end

  def raise_index_error?(i)
    raise IndexError if i > (todos.size - 1) || i < -todos.size
  end

  def item_at(i)
    raise_index_error?(i)
    todos[i]
  end

  def mark_done_at(i)
    raise_index_error?(i)
    self.todos[i].done!
  end

  def mark_undone_at(i)
    raise_index_error?(i)
    self.todos[i].undone!
  end

  def done!
    self.todos.map! { |task| task.done! }
  end

  def shift
    self.todos.shift
  end

  def pop
    self.todos.pop
  end

  def remove_at(i)
    raise_index_error?(i)
    self.todos.delete_at(i)
  end

  def each
    for i in (0...todos.size)
      yield(todos[i])
    end

    self
  end

  def select
    new_todo_list_object = TodoList.new(title)
    self.todos.each do |task|
      new_todo_list_object.add(task) << task if yield(task)
    end

    new_todo_list_object
  end

  def find_by_title(string)
    self.each { |todo| return todo if todo.title == string}
    nil
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !todo.done? }
  end

  def mark_done(string)
    self.each do |todo|
      if todo.title == string
        todo.done!
        break
      end
    end
  end

  def mark_all_done
    self.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    self.each do |todo|
      todo.undone!
    end
  end

  def to_s
    puts "---- Today's Todos ----"
    todos.each { |task| puts task.to_s }
  end

  private
  
  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
