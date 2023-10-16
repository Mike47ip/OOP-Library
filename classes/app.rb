require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase

    case permission
    when 'y'
      student = Student.new(age, nil, name, parent_permission: true)
      @people << student
    when 'n'
      student = Student.new(age, nil, name, parent_permission: false)
      @people << student
    else
      'You have entered an invalid option'
    end

    puts 'You have successfully registered a Student'
  end

  def create_teacher
    print "Teacher's name: "
    name = gets.chomp
    print "Teacher's age: "
    age = gets.chomp.to_i
    print "Teacher's specialization: "
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'You have successfully registered a Teacher'
  end

  def create_person
    print 'Do you want to create a new student (1) or teacher (2)? [Input the number]: '
    type_of_person = gets.chomp.to_i
    case type_of_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'You have entered an invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = Integer(gets.chomp)

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end

    selected_person = Integer(gets.chomp)

    puts 'Date: '
    selected_date = gets.chomp.to_s

    rented = Rental.new(selected_date, @books[selected_book], @people[selected_person])
    @rentals << rented

    puts 'Book was successfully rented'
  end

  def list_rental
    print 'Enter the Person ID: '
    person_id = Integer(gets.chomp)
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title}, Author: #{rent.book.author}" if rent.person.id == person_id
    end
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'Please enter the number for the task you want to perform'
    puts 'choose one of the following'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
