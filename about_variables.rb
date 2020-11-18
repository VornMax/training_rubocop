class AboutVariables
  foo = 'local foo'
  @@foo = 'was ' + foo + ', became class foo'

  def initialize
    @foo = 'instance foo'
  end

  # def show_local_foo
  #   puts foo # undefined local variable
  # end

  def show_class_foo
    puts @@foo
  end

  def show_instance_foo
    puts @foo
  end

  class << self
    # def show_local_foo
    #   puts foo # undefined local variable
    # end

    def show_class_foo
      puts @@foo
    end

    def show_instance_foo
      puts @foo
    end
  end
end

var = AboutVariables.new
p var.show_class_foo # enter class variable
p var.show_instance_foo # enter instance variable

var1 = AboutVariables.show_class_foo
p var1 # enter class variable
var2 = AboutVariables.show_instance_foo
p var2 # empty
