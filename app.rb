require './student.rb'
require './teacher.rb'
require './book.rb'
require './rental.rb'

class App
    attr_accessor :books, :people, :rentals
  
    def initialize
      @books = []
      @people = []
      @rentals = []
    end

  # list all books
  def list_all_books
    if @books.empty?
      puts 'Sorry, the books list is currently empty'
    else
      @books.each do |book|
        puts "Tilte: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  
  # list all people
  def list_all_people
    if @people.empty?
      puts 'Sorry, the people list is currently empty'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
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
    @people.push(student)
    puts 'Person created successfully '
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

   # create book
   def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
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