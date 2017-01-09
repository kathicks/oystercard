class Oystercard
attr_reader :balance

  DEFAULT_BALANCE = 0
  LIMIT = 90

  def initialize(balance=DEFAULT_BALANCE, in_journey = false)
    @balance = balance
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "£#{LIMIT} limit reached" if balance + amount >= LIMIT
    @balance += amount
  end

  def deduct(fare)
    raise "Insufficient funds" if fare > balance
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
