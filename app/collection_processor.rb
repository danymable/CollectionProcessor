class CollectionProcessor
  def process(amount)
    raise 'Amount must be above zero' unless amount.positive?

    service = CreditCardCollectionService.new

    service.process(amount)
  end
end

class CreditCardCollectionService; end
