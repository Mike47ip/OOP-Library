class Classroom
  attr_accessor :lable
  attr_reader :student

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(student)
    @students << student
    student.classroom = self
  end
end
