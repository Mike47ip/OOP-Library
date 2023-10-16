require_relative 'app'
# require_relative 'initial'

def main
  app = App.new
  tasks = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rental,
      7 => :exit,
      default: :invalid_option
    }

  loop do
    app.options
    print 'input: '
    option = gets.chomp.to_i
    selection = tasks[option] || tasks[:default]
    app.send(selection)
    puts "\n"
  end

end

main
