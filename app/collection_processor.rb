class CollectionProcessor
  private attr_reader :service

  SERVICE_FEE = 2

  def initialize(service)
    @service = service
  end

  def process(amount)
    raise 'Amount must be above zero' unless amount.positive?

    service.process(amount + SERVICE_FEE)
  end
end

class CreditCardCollectionService
  def process(amount); end
end

class PaypalCollectionService
  def process(amount); end
end
