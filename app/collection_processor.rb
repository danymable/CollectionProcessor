class CollectionProcessor
  def process(amount)
    raise 'Amount must be greater than zero' unless amount.positive?

    service = CreditCardCollectionService.new

    service.process(amount)
  end
end

# Already existing service

class CreditCardCollectionService
  def process(amount); end
end
