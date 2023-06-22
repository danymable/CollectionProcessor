class CollectionProcessor
  def process(_amount)
    raise 'Amount must be greater than zero'
  end
end

# Already existing service

class CreditCardCollectionService
  def process(amount); end
end
