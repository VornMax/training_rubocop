greeting = proc { |name| "Hello, #{name}. I’m working proc!" }
p greeting.call('Bob')
p greeting.call('Bob', 'Max')
p greeting.call('')
p greeting.call(nil)
p greeting.call(1)
