=begin
Lifter

Get a list of all lifters

Get a list of all the memberships that a specific lifter has

Get a list of all the gyms that a specific lifter has memberships to

Get the average lift total of all lifters

Get the total cost of a specific lifter's gym memberships

Given a gym and a membership cost, sign a specific lifter up for a new gym
=end
require 'pry'
class Lifter
  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift
    all_lift_total = 0
    all.each do |lifter|
      all_lift_total += lifter.lift_total
    end
    all_lift_total.to_f/all.length
  end

  def total_cost
    sum = 0
    memberships.each do |membership|
      sum += membership.cost
    end
    sum
  end

  def sign_up(cost,gym)
    Membership.new(self,gym,cost)
  end

end
