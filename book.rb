class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = auhtor
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, date, self)
    @rentals.push(rental)
    person.rentals.push(rental)
  end
end
