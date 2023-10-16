require_relative 'person'
require_relative 'decorator'
require_relative 'trimmerdecorator'
require_relative 'capitalizedecorator'

# Create a Person object
person = Person.new(age: 22, name: 'maximilianus')

# Decorate the Person object with decorators
capitalized_person = CapitalizeDecorator.new(person)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Display the results
puts person.correct_name
puts capitalized_person.correct_name
puts capitalized_trimmed_person.correct_name
# Create a Person object with the name "Koo" and age 7
person2 = Person.new(age: 7, name: 'Koo')

# Print the name of the person
puts person2.correct_name
