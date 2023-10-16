class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  # can_use_services? overidden to always return true
  def can_use_services?
    true
  end
end
