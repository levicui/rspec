class SimpleClass
  attr_accessor :message

  def initialize
    puts "\nCreating a new instance of the SimpleClass class"
    @message = 'howdy'
  end

  def update_message(new_message)
    @message = new_message
  end
end

# before and after hooks. They provide a way to define and run the setup and teardown code
describe SimpleClass do
  # legit for before, but use as class attribute
  before(:each) { @simple_class = SimpleClass.new }

  # 2.let of course works, as it also runs each
  #let(:simple_class) { SimpleClass.new }

  # 3. let! of course works, as it also runs each
  # let!(:simple_class) { SimpleClass.new }

  # 4. this not work, for sure
  # simple_class = SimpleClass.new

  it 'should have an init msg' do
    expect(@simple_class).to_not be_nil
    @simple_class.message = 'macy'
  end

  it 'should be able to change the message' do
    expect(@simple_class.message).to eq 'howdy'
  end
end

describe "Before and after hooks" do
  before(:all) { puts "Runs before all Examples" }
  after(:all) { puts "Runs after all Examples" }
  before(:each) { puts "Runs before each Example" }
  after(:each) { puts "Runs after each Example" }

  it 'is the first Example in this spec file' do
    puts 'Running the first Example'
  end

  it 'is the second Example in this spec file' do
    puts 'Running the second Example'
  end
end
