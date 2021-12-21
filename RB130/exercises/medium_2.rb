require "minitest/autorun"
require "minitest/reporters"
require "stringio"
Minitest::Reporters.use!

require_relative "transactions"
require_relative "cash_register"

class TestCashRegister < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
  end

  def test_accept_money
    assert_equal(100, @register.total_money)
    @transaction.amount_paid = 30

    @register.accept_money(@transaction)
    assert_equal(130, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 30
    assert_equal(5, @register.change(@transaction))
  end

  def test_give_receipt
    out = capture_io { @register.give_receipt(@transaction) }.first
    assert_match("You've paid $25.", out)
  end

  def test_prompt_for_payment_method
    input = StringIO.new("30\n")
    capture_io { @transaction.prompt_for_payment(input: input) }
    assert_equal(30.0, @transaction.amount_paid)
  end
end