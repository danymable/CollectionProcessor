require './app/collection_processor'

RSpec.describe CollectionProcessor do
  describe '#process' do
    subject(:processor) { CollectionProcessor.new(collection_service) }
    let(:collection_service) { double(CreditCardCollectionService) }

    it 'raises error if amonut is not greater than zero' do
      amount = 0
      expect { processor.process(amount) }.to raise_error 'Amount must be greater than zero'
    end
    context 'with an amount greater than zero' do
      before do
        allow(collection_service).to receive(:process)
      end

      it 'passes amount to cc service' do
        amount = 1
        processor.process(amount)
        expect(collection_service).to have_received(:process).with(amount)
      end
    end
  end
end
