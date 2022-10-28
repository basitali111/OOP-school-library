require './classroom'

describe Classroom do
  context 'when creating new classroom' do
    it 'should have a label property' do
      classroom = Classroom.new(5)
      expect(classroom.label).to eq 5
    end
    it 'the label should receive a numeric value' do
      classroom = Classroom.new(5)
      expect(classroom.label).to be_kind_of Numeric
    end
    it 'should instance of classroom class' do
      classroom = Classroom.new(5)
      expect(classroom).to be_instance_of Classroom
    end
  end
end
