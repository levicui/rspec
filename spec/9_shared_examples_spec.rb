describe 'something' do
  it 'test one thing' do
  end
end

# Shared examples let you describe behaviour of classes or modules. When declared
# a shared group's content is stored. It is only realized in the context of
# another example group, which provides any context the shared group needs to
# run.
# A shared group is included in another group using any of:

# include_examples "name"      # include the examples in the current context
# it_behaves_like "name"       # include the examples in a nested context
# it_should_behave_like "name" # include the examples in a nested context
# matching metadata            # include the examples in the current context

# 1. demo of shared_examples
shared_examples 'some example' do |args|
  # Same behavior is triggered also with either: def something; 'some value'; end
  # or: define_method(:something) { 'some value' }
  let(:something) { args }
  it 'uses the given args' do
    expect(something).to eq(args)
  end
end

describe 'SomeClass' do
  # This example will fail because last let "wins", so comment out this one
  include_examples 'some example', 'parameter1'
  # include_examples 'some example', 'parameter2'
end

# # is equivalent to below:
# describe 'SomeClass' do
#   let(:something) { 'parameter1' }
#   let(:something) { 'parameter2' }
#
#   it 'uses the given parameter' do
#     # This example will fail because last let "wins"
#     expect(something).to eq('parameter1')
#   end
#
#   it 'uses the given parameter' do
#     expect(something).to eq('parameter2')
#   end
# end

# this can be fixed by 'it_behaves_like' so that method overriding is avoided because of
# the nested context created by it_behaves_like
shared_examples 'some example' do |args|
  # Same behavior is triggered also with either: def something; 'some value'; end
  # or: define_method(:something) { 'some value' }
  let(:something) { args }
  it 'uses the given args' do
    expect(something).to eq(args)
  end
end

describe 'SomeClass' do
  # This example will fail because last let "wins"
  it_behaves_like 'some example', 'parameter1'
  it_behaves_like 'some example', 'parameter2'
end

# 2. Common scenarios of shared_examples
# a) Shared examples group included in two groups in one file
require 'set'

shared_examples 'a collection' do
  # bonus point: note that described_class refers to the class or module
  # passed to the `describe` method
  let(:collection) { described_class.new([7, 2, 4]) }

  context 'initialized with 3 items' do
    it 'says it has three items' do
      expect(collection.size).to eq(3)
    end
  end

  describe '#include?' do
    context 'with an item that is in the collection' do
      it 'returns true' do
        expect(collection.include?(7)).to be_truthy
      end
    end

    context 'with an item that is not in the collection' do
      it 'returns false' do
        expect(collection.include?(9)).to be_falsey
      end
    end
  end
end

describe Array do
  it_behaves_like 'a collection'
end

describe Set do
  it_behaves_like 'a collection'
end

# b) Provide context to a shared_group using block
shared_examples 'a collection object' do
  describe '<<' do
    it 'adds objects to the end of the collection' do
      collection << 1
      collection << 2
      # Passes if actual contains all of the expected regardless of order.
      expect(collection).to match_array([1, 2])
    end
  end
end

describe Array do
  it_behaves_like 'a collection object' do
    let(:collection) { [] }
  end
end

describe Set do
  it_behaves_like 'a collection object' do
    let(:collection) { Set.new }
  end
end

# can be also rewritten in subject:
shared_examples 'another collection object' do
  describe '<<' do
    it 'adds objects to the end of the collection' do
      subject << 1 << 2
      # Passes if actual contains all of the expected regardless of order.
      is_expected.to match_array([1, 2])
    end
  end
end

describe Array do
  subject(:collection) { [] }
  it_behaves_like 'another collection object'
end

describe Set do
  subject(:collection) { Set.new }
  it_behaves_like 'another collection object'
end

# c) Passing parameters to a shared example group
shared_examples 'a measurable object' do |measurement, measurement_methods|
  measurement_methods.each do |measurement_method|
    it "should return #{measurement} from ##{measurement_method}" do
      expect(subject.send(measurement_method)).to eq(measurement)
    end
  end
end

describe Array, 'with 3 items' do
  subject { [1, 2, 3] }
  it_behaves_like 'a measurable object', 3, %i[size length]
end

describe String, 'of 6 characters' do
  subject { 'FooBar' }
  it_behaves_like 'a measurable object', 6, %i[size length]
end
