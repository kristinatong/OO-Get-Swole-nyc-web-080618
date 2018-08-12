=begin
Gym

Get a list of all gyms

Get a list of all memberships at a specific gym

Get a list of all the lifters that have a membership to a specific gym

Get a list of the names of all lifters that have a membership to that gym

Get the combined lift_total of every lifter has a membership to that gym
=end

class Gym
 @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lifter_names
    lifters.map do |lifter|
      lifter.name
    end
  end

  def lift_total_for_gym
    sum = 0
    lifters.each do |lifter|
      sum += lifter.lift_total
    end
    sum
  end

end
