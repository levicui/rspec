# https://www.tutorialspoint.com/rspec/rspec_test_doubles.htm
class ClassRoom
  def initialize(students)
    @students = students
  end

  def list_student_names
    @students.map(&:name).join(',')
  end
end


# Also, if we have a “dummy” class that behaves like a Student object then our
# ClassRoom tests will not depend on the Student class. We call this test isolation.

describe ClassRoom do
  context 'test the double to mock Student class which even not being defined' do
    it 'should work for list_student_name even student class not defined' do
      stu1 = double('student')  # a faked class just to provide a field called 'name'
      stu2 = double('student')

      allow(stu1).to receive(:name) { 'john' }
      allow(stu2).to receive(:name) { 'lily' }
      cr = ClassRoom.new [stu1, stu2]
      expect(cr.list_student_names).to eq('john,lily')
    end
  end
end