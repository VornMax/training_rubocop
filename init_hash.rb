class Car
  attr_accessor :firm, :weight, :engine, :speed

  def initialize(args)
    @firm = args[:firm]
    @weight = args[:weight]
    @engine = args[:engine]
    @speed = args[:speed]
  end
end

audi = Car.new({
                 firm: 'Audi',
                 weight: 2000,
                 engine: 2.0
               })

p audi.firm
p audi.weight
p audi.engine
p audi.speed
