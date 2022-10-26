require './teacher'
require './rental'
require './modules/books_module'
require './modules/persons_module'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = BooksModule.new
    @people = PersonsModule.new
    @rentals = []
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
    @people.push(teacher)
    puts 'Person created successfully'
  end

  # create rental
  def create_rental
    return unless @books.length.positive?

    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, i|
      puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_choice = gets.chomp.to_i
    puts 'select a person from the following list by number (not id)'

    return unless @people.length.positive?

    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_choice = gets.chomp.to_i

    print 'Date: '
    date_choice = gets.chomp
    rental = Rental.new(date_choice, @people[person_choice], @books[book_choice])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  # list all rentals for a given person id
  def list_all_rentals
    if @rentals.empty?
      puts 'Rentals list is empty'
    else
      print 'ID of person : '
      person_id = gets.chomp.to_i

      @people.each do |person|
        next unless person.id == person_id

        person.rentals.each_with_index do |rental, _i|
          puts " \n Rentals: \n Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end
end
