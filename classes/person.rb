require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = [] # Initialize an empty array for rentals
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Method to associate a rental with a person
  def rent_book(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end
end
