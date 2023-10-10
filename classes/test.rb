# main.rb
require_relative 'person'

# Creating a Person object with name "Michael" and age 18
person = Person.new("Michael", 18)

# Accessing and printing the attributes of the Person object
puts "Name: #{person.name}"
puts "Age: #{person.age}"
