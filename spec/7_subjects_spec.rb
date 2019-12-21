class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

end

describe Person do
  it 'create a new person with a first and last name' do
    person = Person.new 'John', 'Smith'

    expect(person).to have_attributes(first_name: 'John')
    expect(person).to have_attributes(last_name: 'Smith')
  end
end

# The subject is the object being tested. RSpec has an explicit idea of the subject.
# It may or may not be defined. If it is, RSpec can call methods on it without referring to it explicitly.

# Using rspec Subject can simplify this by moving the Person.new here
# make this much cleaner
# However, it's only helpful to use an implicit subject when the context is
# likely to be well understood by all readers and there is really no need for an example description
describe Person.new 'John', 'Smith' do
  it { is_expected.to have_attributes(first_name: 'John') }
  it { is_expected.to have_attributes(last_name: 'Smith') }
end

# By default, if the first argument to an outermost example group (describe or context block)
# is a class, RSpec creates an instance of that class and assigns it to the subject. For example, the following passes:
class A
end

describe A do
  it 'is instantiated by RSpec' do
    expect(subject).to be_an(A)
  end
end

# You can define the subject yourself with subject:
describe 'anonymous subject' do
  subject { A.new }
  it 'has been instantiated' do
    expect(subject).to be_an(A)
  end
end

# You can give the subject a name when you define it:
describe 'named subject' do
  subject(:a) { A.new }
  it 'has been instantiated' do
    expect(a).to be_an(A)
  end
end

# Even if you name the subject, you can still refer to it anonymously:
describe 'named subject' do
  subject(:a) { A.new }
  it 'has been instantiated' do
    expect(subject).to be_an(A)
  end
end
