require './rental'
require './modules/books_module'
require './modules/persons_module'
require './modules/rentals_module'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = BooksModule.new
    @people = PersonsModule.new
    @rentals = RentalsModule.new
  end
end
