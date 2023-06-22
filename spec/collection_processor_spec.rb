require './app/collection_processor'

RSpec.describe CollectionProcessor do
  subject(:processor) { CollectionProcessor.new(service) }
  describe '#process' do
    let(:service) { double(CreditCardCollectionService, process: nil) }
    it 'raises an error unless amount above zero' do
      amount = 0

      expect { processor.process(amount) }.to raise_error('Amount must be above zero')
    end

    context 'when amount is above zero' do
      [{ amount: 25, service_fee: 2 },
       { amount: 100, service_fee: 4 },
       { amount: 101, service_fee: 8 }].each do |test|
        it 'adds a service fee' do
          amount = test[:amount]
          service_fee = test[:service_fee]

          expected_total = amount + service_fee

          processor.process(amount)
          expect(service).to have_received(:process).with(expected_total)
        end
      end
    end
  end
end
