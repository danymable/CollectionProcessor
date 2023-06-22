class CollectionProcessor
  private attr_reader :service

  def initialize(service)
    @service = service
  end

  def process(amount)
    raise 'Amount must be above zero' unless amount.positive?

    service.process(amount)
  end
end

class CreditCardCollectionService
  def process(amount); end
end
