require './nameable'
require './rental'
require './book'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
