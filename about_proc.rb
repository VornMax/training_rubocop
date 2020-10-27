# class Greet
#   def greet_meth(name)
#     "Hello, #{name}. Im working proc!"
#   end
# end

# g = Greet.new
# p g.greet_meth('Bob')

GREET = proc { |name| "Hello, #{name}. I’m working proc!" }
# p GREET.call('Bob')
# p GREET.call('Bob', 'Max')
# p GREET.call('')
# p GREET.call(nil)
# p GREET.call(1)
