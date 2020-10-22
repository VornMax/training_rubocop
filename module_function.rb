module Hello
  module_function

  # private method
  def say(name)
    "Hello, #{name}"
  end
end

class Greet
  include Hello

  def hello_world
    say('world')
  end
end

g = Greet.new
puts g.hello_world
puts g.say('Ruby') # don't work
# you can use singleton methods if module mixed with extend.
# you can use instance methods if module mixed with include.
