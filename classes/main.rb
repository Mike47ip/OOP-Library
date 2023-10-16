require_relative 'app'
require_relative 'initial'

def main
  app = App.new

  initial(app)
end

main
