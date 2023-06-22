class CollectionProcessor
  private attr_reader :service

  TIER_ONE_FEE = 2
  TIER_TWO_FEE = 4
  TIER_THREE_FEE = 8

  def initialize(service)
    @service = service
  end

  def process(amount)
    raise 'Amount must be above zero' unless amount.positive?

    total = add_service_fee(amount)

    service.process(total)
  end

  private

  def add_service_fee(amount)
    return amount + TIER_ONE_FEE if amount <= 25
    return amount + TIER_TWO_FEE if amount <= 100

    amount + TIER_THREE_FEE
  end
end

class CreditCardCollectionService
  def process(amount); end
end

class PaypalCollectionService
  def process(amount); end
end
