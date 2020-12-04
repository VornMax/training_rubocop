require 'rspec'

require_relative '../lib/time.rb'

describe TimeConvert do
  context 'check create class and method' do
    let(:tc) { TimeConvert.new }

    it 'creates a TimeConvert class' do
      expect(tc).to be_kind_of(TimeConvert)
    end

    it 'converts sections' do
      expect(tc).to respond_to(:time_convert)
    end
  end

  context 'when correct input' do
    let(:tc) { TimeConvert.new }

    it 'converts five sections in three sections' do
      input = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']]
      output = [['00:00', '10:00'], ['10:20', '10:40'], ['13:00', '23:59']]

      expect(tc.time_convert(input)).to eq(output)
    end

    it 'converts two sections in three sections' do
      input =  [['10:00', '10:20'], ['10:40', '11:00']]
      output = [['00:00', '10:00'], ['10:20', '10:40'], ['11:00', '23:59']]

      expect(tc.time_convert(input)).to eq(output)
    end

    it 'converts one section in two section' do
      input =  [['10:00', '10:20']]
      output = [['00:00', '10:00'], ['10:20', '23:59']]

      expect(tc.time_convert(input)).to eq(output)
    end
  end

  context 'when correct input, inner sector' do
    let(:tc) { TimeConvert.new }
    it 'converts when time closed' do
      input = [['10:00', '13:20'], ['11:00', '12:00']]
      output = [['00:00', '10:00'], ['13:20', '23:59']]

      expect(tc.time_convert(input)).to eq(output)
    end
  end

  context 'when uncorrect input' do
    let(:tc) { TimeConvert.new }
    it 'enters invalid values' do
      mistakes = [nil, ' ', [], {}, 'blabla', [['blabla'], ['blabla']], [['']], [[['']]], [[[['']]]], [[[[['']]]]]]
      output = 'Uncorrect input'

      mistakes.each do |mistake|
        expect(tc.time_convert(mistake)).to eq(output)
      end
    end
  end
end
