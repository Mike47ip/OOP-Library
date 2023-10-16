require_relative 'app'

TASKS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rental,
  default: :invalid_option
}.freeze

def main
  app = App.new
  loop do
    app.options
    print 'input: '
    option = gets.chomp.to_i
    if option == 7
      puts 'Exiting... Thank you'
      break
    end
    selection = TASKS[option] || TASKS[:default]
    app.send(selection)
    puts "\n"
  end
end

main
