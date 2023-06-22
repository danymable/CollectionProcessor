require './app/collection_processor'

RSpec.describe CollectionProcessor do
  subject(:processor) { CollectionProcessor.new }
  it 'raises an error unless amount above zero' do
    amount = 0

    expect { processor.process(amount) }.to raise_error('Amount must be above zero')
  end
end
