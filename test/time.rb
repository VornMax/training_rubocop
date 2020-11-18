class TimeConvert
  require 'date'

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def convert_fragment
    minutes_array = []
    sort_middle = []
    result_array = []
    output = []

    hour_conversion(input, minutes_array)

    join_fragment(sort_middle, minutes_array, result_array)

    #create_new_fragments(sort_middle, result_array)

    convert(result_array, output)
  end

  private

  def hour_conversion(input, minutes_array)
    input.each do |x|
      result = []
      x.each do |i|
        d = DateTime.parse(i)
        result << d.hour * 60 + d.minute
      end
      minutes_array << result
    end
    minutes_array.sort!
  end

  def join_fragment(sort_middle, minutes_array, result_array)
    minutes_array.each do |i|
      if sort_middle.empty?
        sort_middle << i
      elsif sort_middle[-1][1] >= i[0]
        sort_middle = sort_middle[0..-2] + [[sort_middle[-1][0], i[1]]] if sort_middle[-1][1] < i[1]
      else
        sort_middle << i
      end
    end
    create_new_fragments(sort_middle, result_array)
  end

  def create_new_fragments(sort_middle, result_array)
    first_minute = 0
    last_minute = 1439
    result_array << [sort_middle[0][1], sort_middle[1][0]]
    result_array << [first_minute, sort_middle[0][0]]
    result_array << [sort_middle[1][1], last_minute]
    result_array.sort!
  end

  def minutes_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    hours = '00' if hours.zero?
    rest = '00' if rest.zero?
    "#{hours}:#{rest}"
  end

  def convert(result_array, output)
    result_array.each do |x|
      result = []
      x.each do |y|
        result << minutes_conversion(y)
      end
      output << result
    end
    output
  end
end

input = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']]

tc = TimeConvert.new(input)
p tc.convert_fragment
