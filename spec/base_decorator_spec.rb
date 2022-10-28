require './base_decorator'
require './person'

describe BaseDecorator do
  context 'When using the correct_name method from the BaseDecorator class' do
    it 'should return the correct  name' do
      person = Person.new(22, 'alphayo')
      expect(person.name).to eq('alphayo')
    end
  end
end
