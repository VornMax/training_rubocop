class HistogramGenerator
  def initialize; end

  def self.process_string(string:)
    if !string.empty?
      string.gsub(/[ ,.\r\n]/, ' ').split(' ').each_with_object(Hash.new(0)) { |word, result| result[word] += 1 }
    else
      {}
    end
  end

  def self.sort_histogram(histogram)
    sort1 = ->(_word, occurencies) { occurencies }
    histogram.sort_by { |word, occurencies| sort1.call(word, occurencies) }.to_h
  end
end

module App
  TEXT = 'When Mr. and Mrs. Dursley woke up on the dull, gray Tuesday our story
starts, there was nothing about the cloudy sky outside to suggest that
strange and mysterious things would soon be happening all over the
country. Mr. Dursley hummed as he picked out his most boring tie for
work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
Dudley into his high chair.'.freeze

  module_function

  def perform
    text = ''
    puts('reading file')
    puts("extracted string: #{text}")
    histogram = HistogramGenerator.process_string(string: TEXT)
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(HistogramGenerator.sort_histogram(histogram))
  end

  def case_numb(number)
    hash = { 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
             6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }.freeze
    if hash.key?(number)
      hash[number]
    else
      'oops'
    end
  end
end

puts App.perform
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each { |number| puts App.case_numb(number) }
