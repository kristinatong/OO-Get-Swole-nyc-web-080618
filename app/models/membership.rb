=begin
Membership

Get a list of all memberships
=end
class Membership
  @@all = []

  attr_reader :cost,:lifter,:gym

  def initialize(lifter,gym,cost)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self
  end

  def self.all
    @@all
  end



end
