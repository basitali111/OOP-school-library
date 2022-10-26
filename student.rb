require './person'

# Adiing student class
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, _parent_permission)
    super(age, name, parent_permission: true)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_Json (*_args)
    {
    JSON.create_id => self.class.name,
    'id' => @id,
    'age' => @age,
    'name' => @name,
    'parent_permission' => @parent_permission
    }
  end
end
