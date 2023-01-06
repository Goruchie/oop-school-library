require "./person.rb"

class Teacher < Person
    def initialize(name = "Unknown", age, parent_permission = true, specialization)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
        @specialization = specialization
    end

    def can_use_services?
        true
    end
