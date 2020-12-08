require_relative 'pet'
require_relative 'job'

class Human
  def feed_pet
    Pet.feed('meat')
  end

  def work
    Job.receive_salary
  end
end
