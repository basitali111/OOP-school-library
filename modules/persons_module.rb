require './student'
require 'json'
require './teacher'

class PersonsModule
  attr_reader :file_location, :people

  def initialize
    @file_location = 'storage/persons.json'
    file = File.open(@file_location)
    @people = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  # create a person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    selected_number = gets.chomp.to_i
    case selected_number
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Kindly select either 1 or 2 only'
    end
  end

  # create student
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'Kindly enter either Y or N only'
    end

    student = Student.new(age, name, parent_permission)
    store_person(student)

    puts 'Person created successfully '
  end

  def store_person(person)
    person = person.to_json
    @people.push(person)

    file = File.open(@file_location, 'w')
    file.write(JSON[@people])
    file.close
  end

  # list all people
  def list_all_people
    if @people.empty?
      puts 'Sorry, the people list is currently empty'
    else
      @people.each do |person|
        puts "[#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end
  end

  # create teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)

    store_person(teacher)

    puts 'Person created successfully'
  end
end
