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
      [25, 50, 100].each do |amount|
        it 'adds a service fee' do
          service_fee = 2
          expected_total = amount + service_fee

          processor.process(amount)
          expect(service).to have_received(:process).with(expected_total)
        end
      end
    end
  end
end
