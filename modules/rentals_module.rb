require 'json'
require './modules/persons_module'
require './modules/books_module'

class RentalsModule
  attr_reader :file_location, :books, :people

  def initialize
    @file_location = 'storage/rentals.json'
    file = File.open(@file_location)
    @rentals = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
    @people = PersonsModule.new
    @books = BooksModule.new
  end

  # create rental
  def create_rental
    return unless @books.books.length.positive?

    puts 'Select a book from the following list by number'
    @books.books.each_with_index do |book, i|
      puts "#{i}) Title: \"#{book['title']}\", Author: #{book['author']}"
    end
    book_choice = gets.chomp.to_i
    puts 'select a person from the following list by number (not id)'

    return unless @people.people.length.positive?

    @people.people.each_with_index do |person, i|
      puts "#{i}) [#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_choice = gets.chomp.to_i

    print 'Date: '
    date_choice = gets.chomp
    rental = Rental.new(date_choice, @people.people[person_choice], @books.books[book_choice])
    # @rentals.push(rental)
    store_rental(rental)
    puts 'Rental created successfully'
    sleep(1)
  end

  def store_rental(rental)
    rental = rental.to_json
    @rentals.push(rental)

    file = File.open(@file_location, 'w')
    file.write(JSON[@rentals])
    file.close
  end

  # list all rentals for a given person id
  def list_all_rentals
    if @rentals.empty?
      puts 'Rentals list is empty'
    else
      print 'ID of person : '
      person_id = gets.chomp.to_i

      @people.people.each do |person|
        next unless person['id'] == person_id

        @rentals.each do |rental|
          if rental['person']['id'] == person_id
            puts " \n Rentals: \n Date: #{rental['date']}, Book \"#{rental['book']['title']}\" by #{rental['book']['author']}"
          end
        end
      end
    end
  end
end
