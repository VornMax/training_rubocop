class TimeConvert
  require 'date'

  attr_reader :input

  def convert_fragment(input)
    minutes_array = []
    @sort_middle = []
    result_array = []
    output = []

    check_input(input)

    hour_conversion(input, minutes_array)

    delete_inner_sector(minutes_array) if input.length > 1

    join_fragment(minutes_array)

    create_new_fragments(result_array, input)

    convert(result_array, output)
  end

  private

  attr_reader :sort_middle

  def check_input(input)
    mistakes = [nil, [], '', [''], ' ']
    mistakes.each do |mistake|
      abort 'Uncorrect input!' if input == mistake
    end
  end

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

  def join_fragment(minutes_array)
    minutes_array.each do |i|
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

  def create_new_fragments(result_array, input)
    first_minute = 0
    last_minute = 1439
    result_array << [@sort_middle[0][1], last_minute] if @sort_middle.length <= 1
    if_more_two_fragments(result_array, input, last_minute)
    result_array << [first_minute, @sort_middle[0][0]]
    result_array.sort!
  end

  def if_more_two_fragments(result_array, _input, last_minute)
    return unless @sort_middle.length >= 2

    result_array << [@sort_middle[0][1], @sort_middle[1][0]]
    result_array << [@sort_middle[1][1], last_minute]
  end

  def minutes_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    hours = '00' if hours.zero?
    rest = '00' if rest.zero?
    "#{hours}:#{rest}"
  end

  def delete_inner_sector(minutes_array)
    (0..minutes_array.length).each do |i|
      (0..1).each do |j|
        if minutes_array[i][j + 1] >= minutes_array[i + 1][j + 1] && minutes_array[i][j] <= minutes_array[i + 1][j]
          minutes_array.delete_at(1)
          return minutes_array
        else
          return minutes_array
        end
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
