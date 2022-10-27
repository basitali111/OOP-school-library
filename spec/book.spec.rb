require './book'
require './person'

describe 'add_rental' do
  it 'returns an array with one rental object' do
    person = Person.new(34, 'Juma')
    book = Book.new('River Between', 'Ngugi wa Thiongo')
    book.add_rental(person, '2022/09/18')
    expect(book.rentals.length).to eq(1)
  end
end