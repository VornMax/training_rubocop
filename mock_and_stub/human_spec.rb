# frozen_string_literal: true

require_relative 'human'
require_relative 'pet'
require_relative 'job'

RSpec.describe 'Human' do
  let(:human) { double('human') }

  it 'feeds a dog' do
    allow(human).to receive(:feed).with('meat')
    # mock

    ih = Human.new
    ih.feed_pet
  end

  it 'gets a salary' do
    allow(human).to receive(:work).and_return('salary')
    # stub

    expect(human.work).to eq('salary')

    ih = Human.new
    ih.work
  end
end
