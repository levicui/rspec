
class Dog
  attr_reader :good_dog, :has_been_walked

  def initialize(good_or_not)
    @good_dog = good_or_not
    @has_been_walked = false
  end

  def walk_dog
    @has_been_walked = true
  end
end

describe Dog do

  # This is a rspec helper which allows us to define an example shared method
  def create_and_walk_dog(good_or_bad)
    dog = Dog.new(good_or_bad)
    dog.walk_dog
    dog
  end

  it 'should be able to create and walk a good dog' do
    dog = create_and_walk_dog(true)

    expect(dog.good_dog).to be_truthy
    expect(dog.has_been_walked).to be_truthy
  end

  it 'should be able to create and walk a bad dog' do
    dog = create_and_walk_dog(false)

    expect(dog.good_dog).to be false
    expect(dog.has_been_walked).to be true
  end
end
