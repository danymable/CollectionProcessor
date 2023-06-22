class CollectionProcessor
  private attr_reader :service
  def initialize(service)
    @service = service
  end

  def process(amount)
    raise 'Amount must be greater than zero' unless amount.positive?

    service.process(amount)
  end
end

# Already existing service

class CreditCardCollectionService
  def process(amount); end
end

class PaypalCardCollectionService
  def process(amount); end
end
