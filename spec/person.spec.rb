require './person'
require './book'

describe 'can_use_services' do
  it 'returns true if age is equal or greater than 18 or parent permission is true' do
    person = Person.new(34, 'Juma')
    expect(person.can_use_services?).to eq(true)
  end
end

describe 'correct_name method' do
  it 'returns correct nameof the person' do
    person = Person.new(34, 'Juma')
    expect(person.correct_name).to eq('Juma')
  end
end
describe 'add_rental method' do
  it 'returns a rental object containing the person renting and book being rented' do
    person = Person.new(34, 'Juma')
    book = Book.new('River Between', 'Ngugi wa Thiongo')
    rental = person.add_rental('2022/12/24', book)
    expect(rental.person).to eq(book)
    expect(rental.book).to eq(person)
  end
end
