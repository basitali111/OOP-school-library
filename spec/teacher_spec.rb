require './teacher'
require './book'

describe Teacher do
  before :each do
    @teacher = Teacher.new(39, 'Micheal Burry', '.nET')
  end

  context 'when teacher object is created' do
    it 'correct teacher details' do
      expect(@teacher.age).to eq(39)
      expect(@teacher.name).to eq('Micheal Burry')
    end
  end

  context 'checking the services method for teacher' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
