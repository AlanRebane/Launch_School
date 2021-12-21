require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class SomeVariables
  attr_accessor :list, :value

  def initialize
    @list = []
    @value = nil
  end

  def process
    'a'
  end
end

class AssertionsTest < MiniTest::Test
  def setup
    @list = SomeVariables.new.list
    @value = SomeVariables.new.value
  end

  def test_nil_assertions
    assert_nil @value
  end

  def test_empty_object_assertions
    assert_empty @list
  end

  def test_included_object_assertions
    @list << 'xyz'
    assert_includes(@list, 'xyz')
  end

  # def test_exception_assertions
  #   assert_raises(NoExperienceError) { employee.hire }
  # end

  def test_type_assertions
    @kongo = Numeric.new
    assert_instance_of(Numeric, @kongo)
  end

  def test_assert_same
    #assert_same(list, list.process)
    # Tests whether list and list.process are the same object
  end

  def test_refutation
    refute_includes(@list, 'xyz')
  end

end