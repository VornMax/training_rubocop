# frozen_string_literal: true

require_relative 'pet'
require_relative 'job'
# Class Human
class Human
  def feed_pet
    Pet.feed('meat')
  end

  def work
    Job.receive_salary
  end
end
