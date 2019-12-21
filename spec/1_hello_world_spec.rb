require 'rspec'

class HelloWorld
  def say_hello
    'Hello World!'
  end
end

# 1. 'describe' is used to define an “Example Group”. You can think of an
# “Example Group” as a collection of tests. It takes a class or string.
describe HelloWorld do

  # 2. 'context' helps to enclose tests of a certain type.
  context 'When testing the HelloWorld class' do

    # 3. it is a keyword for representing a test
    it "should say 'Hello World' when we call the say_hello method" do
      hw = HelloWorld.new
      message = hw.say_hello

      # 4. expect is used as verification step, to or not_to is the start of the assertion
      # eq compares the equivalence and cast the type
      expect(message).to eq 'Hello World!'
      # eql compares the equivalence but not cast type
      expect(message).to eql 'Hello World!'
      # equal compares the object identity
      expect(message).not_to equal 'Hello World!'
    end

  end
end

