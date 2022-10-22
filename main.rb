require './app'

def start_app(app, selection)
  case selection
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_all_rentals
  else
    puts 'Kindly select from 1 to 6 only'
  end
end

def main
  app = App.new
  puts 'Welcome to our school library'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    selection = gets.chomp.to_i
    if selection == 7
      puts 'Thank you for using our library'
      break
    end
    start_app(app, selection)
  end
end

main
