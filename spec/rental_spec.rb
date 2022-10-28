require './book'
require './rental'
require './person'

describe Rental do
  before :each do
    @student = Person.new(39, 'Basit Ali')
    @book = Book.new('Microverse', 'Basit Ali')
    @rent = Rental.new('2022/10/06', @student, @book)
  end

  context 'get total persons' do
    it 'should populate person' do
      expect(@rent.person.name).to eq('Basit Ali')
    end
  end

  describe '#new' do
    it 'instance of Rental object created' do
      expect(@rent).to be_an_instance_of Rental
    end
  end
end
