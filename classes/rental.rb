class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    book.rentals << self
    person.rentals << self
  end

  def add_rentals(person, date)
    Rental.new(date, self, person)
  end
end
