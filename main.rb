require './start'

def main
  start = Start.new
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
    start.start_app(selection)
  end
end

main
