require './app'

class Start
  def initialize
    @app = App.new
  end

  def start_app(selection)
    case selection
    when 1
      @app.books.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.books.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals
    else
      puts 'Kindly select from 1 to 6 only'
    end
  end
end
