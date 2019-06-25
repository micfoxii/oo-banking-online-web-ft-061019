class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    #reject transfer if sender does not have valid account
    if self.sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
      #execute transaction between two accounts
      #elsif self.status = "complete"
    elsif self.status == "complete"
      "Already Executed"  
    else
      self.sender.deposit(self.amount * -1)
      self.receiver.deposit(self.amount)
      self.status = "complete"
      #each transfer can only happen once

    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(self.amount * -1)
      self.status = "reversed"
    end
  end
  # your code here
end
