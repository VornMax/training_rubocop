# frozen_string_literal: true

# Class for convert time section in periods.
class TimeConvert
  require 'date'

  attr_reader :input

  def time_convert(input)
    return 'Uncorrect input' if input.class != Array || input.nil? || input.empty?

    (0..input.length - 1).each do |arr|
      (0..1).each do |item|
        return 'Uncorrect input' if input[arr][item].class != String
      end
    end

    convert_fragment(input)
  end

  def convert_fragment(input)
    minutes_arr = []
    @sort_middle = []
    result_array = []
    output = []

    hour_conversion(input, minutes_arr)

    delete_inner_sector(minutes_arr) if input.length > 1

    join_fragment(minutes_arr)

    create_new_fragments(result_array)

    convert(result_array, output)
  end

  private

  attr_reader :sort_middle

  def hour_conversion(input, minutes_arr)
    input.each do |x|
      minutes = 60
      result = []
      x.each do |i|
        d = DateTime.parse(i)
        result << d.hour * minutes + d.minute
      end
      minutes_arr << result
    end
    minutes_arr.sort!
  end

  def join_fragment(minutes_arr)
    minutes_arr.each do |i|
      if @sort_middle.empty?
        @sort_middle << i
      elsif @sort_middle[-1][1] >= i[0]
        @sort_middle = @sort_middle[0..-2] + [[@sort_middle[-1][0], i[1]]] if @sort_middle[-1][1] < i[1]
      else
        @sort_middle << i
      end
    end
    @sort_middle
  end

  def create_new_fragments(result_array)
    first_minute = 0
    last_minute = 1439
    result_array << [@sort_middle[0][1], last_minute] if @sort_middle.length <= 1
    if_more_two_fragments(result_array, last_minute)
    result_array << [first_minute, @sort_middle[0][0]]
    result_array.sort!
  end

  def if_more_two_fragments(result_array, last_minute)
    return unless @sort_middle.length >= 2

    result_array << [@sort_middle[0][1], @sort_middle[1][0]]
    result_array << [@sort_middle[1][1], last_minute]
  end

  def minutes_conversion(minutes)
    one_hour = 60
    hours = minutes / one_hour
    rest = minutes % one_hour
    hours = '00' if hours.zero?
    rest = '00' if rest.zero?
    "#{hours}:#{rest}"
  end

  def inner_sections?(minutes_arr, arr, time)
    minutes_arr[arr][time + 1] >= minutes_arr[arr + 1][time + 1] && minutes_arr[arr][time] <= minutes_arr[arr + 1][time]
  end

  def delete_inner_sector(minutes_arr)
    (0..minutes_arr.length).each do |arr|
      (0..minutes_arr.length).each do |time|
        return minutes_arr unless inner_sections?(minutes_arr, arr, time)

        minutes_arr.delete_at(1)
        return minutes_arr
      end
    end
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

# input = [['blabla'], ['blabla']]
# # input = [['10:00', '13:20'], ['11:00', '12:00']]
# tc = TimeConvert.new
# p tc.time_convert(input)
