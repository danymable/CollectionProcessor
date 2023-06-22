require './app/collection_processor'

RSpec.describe CollectionProcessor do
  subject(:processor) { CollectionProcessor.new(service) }
  describe '#process' do
    let(:service) { double(CreditCardCollectionService, process: nil) }
    it 'raises an error unless amount above zero' do
      amount = 0

      expect { processor.process(amount) }.to raise_error('Amount must be above zero')
    end

    it 'passes amount on to the CollectionService' do
      amount = 100
      processor.process(amount)
      expect(service).to have_received(:process).with(amount)
    end
  end
end
