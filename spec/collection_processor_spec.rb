require './app/collection_processor'

RSpec.describe CollectionProcessor do
  describe '#process' do
    subject(:processor) { CollectionProcessor.new }
    it 'raises error if amonut is not greater than zero' do
      amount = 0
      expect { processor.process(amount) }.to raise_error 'Amount must be greater than zero'
    end
  end
end
