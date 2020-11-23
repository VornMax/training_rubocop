require 'rspec'
require_relative '../lib/time.rb'

describe TimeConvert do
  let(:tc) { TimeConvert.new }

  it 'gets three sections' do
    input = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']]
    output = [['00:00', '10:00'], ['10:20', '10:40'], ['13:00', '23:59']]

    expect(tc.convert_fragment(input)).to eq(output)
  end

  it 'get three sections, have two secttion' do
    input =  [['10:00', '10:20'], ['10:40', '11:00']]
    output = [['00:00', '10:00'], ['10:20', '10:40'], ['11:00', '23:59']]

    expect(tc.convert_fragment(input)).to eq(output)
  end

  it 'get two sections, have one secttion' do
    input =  [['10:00', '10:20']]
    output = [['00:00', '10:00'], ['10:20', '23:59']]

    expect(tc.convert_fragment(input)).to eq(output)
  end
end
