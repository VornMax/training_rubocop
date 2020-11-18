# block = proc { |x| x.even? }
# p [*1..10].select(&block)

# p [*1..10].select(&:even?) short form

# square = proc { |x| x**2 }
# p square.call(3)
# p square.(4)
# p square[5]

# def gen_times(factor)
#   proc { |n| n * factor }
# end
# times3 = gen_times(3)
# times10 = gen_times(10)
# p times10.call(25)
# p times3.call(12)
# p times3.call(times10.call(20))

# def make_proc(&block)
#   block
# end
# proc3 = make_proc { |x| x**2 }
# p proc3[201]

# lambda1 = lambda { |x| x**2 }
# lambda2 = ->(x) { x**2 }
# p lambda2.call(31_024)

# def one_two_three
#   yield 1
#   yield 2
#   yield 3
# end
# one_two_three { |number| puts number * 10 }

# def explicit_block(&block)
#   block.call # same as yield
# end
# explicit_block { puts 'Explicit block called' }

# my_lambda = -> { puts 'Lambda called' }
# my_lambda.===

# my_lambda = -> { return 1 }
# puts "Lambda result: #{my_lambda.call}"
# my_proc = proc { return 1 }
# puts "Proc result: #{my_proc.call}" this string doesn't print

# def call_proc(my_proc)
#   my_proc.call
# end
# count = 1
# my_proc = proc do
#   puts count # ==> print 1
#   return count # ==> nil without return
# end
# p call_proc(my_proc)

# proc1 = proc { |x, y| p x }
# p [[1, 2], [3, 4]].map(&proc1)

# def proc_from
#   Proc.new
# end
# proc1 = proc_from { "hello" }
# proc1.call don't work

# a_proc = proc { |a, b| [a, b] }
# p a_proc.call(2, 4)

# a_proc = proc { |scalar, *values| values.map { |value| value * scalar } }
# p a_proc.call(9, 1, 2, 3)

# a_proc = proc { |a, b| [a, b] }
# p a_proc.call(1)   #=> [1, nil]

# METHODS
class Thing
  def square(num)
    num * num
  end
end
thing = Thing.new
meth  = thing.method(:square)

p meth.call(9)                 #=> 81
p [*1..20].collect(&meth)
