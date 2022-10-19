# frozen_string_literal: true

require './person'
# frozen_string_literal: true
class Teacher < Person
  attr_accessor :specialization

  def initialize(name = 'Unknown', age, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
