require './student'

describe 'play_hooky method' do
  it 'returns a symbol symbolizing hooky' do
    student = Student.new(17, 'Neema', true)
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
