require './base_decorator'
require './person'

describe CapitalizeDecorator do
  context 'When using the correct_name method from the CapitalizeDecorator class' do
    it 'should return the name in capitalized' do
      person = Person.new(22, 'alphayo')
      capitalized_name = CapitalizeDecorator.new(person)
      expect(capitalized_name.correct_name).to eql 'Alphayo'
    end
  end
end
