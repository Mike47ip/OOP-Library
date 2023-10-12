require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
    classroom.add_student(self) # Automatically add the student to the classroom.
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
