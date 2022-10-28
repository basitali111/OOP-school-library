require './trimmer_decorator'
require './base_decorator'
require './person'

describe 'correct name method' do
  it 'returns trimmed correct name by the first ten characters' do
    person = Person.new(22, 'maximilianus')
    trimmed_name = TrimmerDecorator.new(person).correct_name
    expect(trimmed_name).to eq('maximilian')
  end
end
