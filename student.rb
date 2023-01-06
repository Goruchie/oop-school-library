# frozen_string_literal: true

require './person'
# this is a class for any Student
class Student < Person
  def initialize(name, age, parent_permission, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
