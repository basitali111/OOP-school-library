# frozen_string_literal: true

require './person'

class Student < Person
  def initialize(name = 'Unknown', age, classroom, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
