require_relative 'person'
require_relative 'decorator'
require_relative 'trimmerdecorator'
require_relative 'capitalizedecorator'

# Create a Person object
person = Person.new(22, 'maximilianus')

# Decorate the Person object with decorators
capitalized_person = CapitalizeDecorator.new(person)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Display the results
puts person.correct_name
puts capitalized_person.correct_name
puts capitalized_trimmed_person.correct_name
