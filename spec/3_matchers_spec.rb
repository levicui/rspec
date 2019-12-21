describe 'An example of the equality Matchers' do
  context 'test' do
    it 'should show how the equality Matchers work' do
      a = 'test string'
      b = a

      expect(a).to eq 'test string'
      expect(a).to eql 'test string'
      expect(a).to be b
      expect(a).to equal b
    end

    it 'should show how comparison works' do
      a, b, c = 1, 2, 3
      d = 'testing'

      expect(b).to be > a
      expect(a).to be < b
      expect(a).to be <= a
      expect(b).to be <= b
      expect(c).to be_between(1, 3)
      expect(c).to be_between(1, 3).inclusive
      expect(b).to be_between(1, 3).exclusive
      # Passes when actual matches a regular expression
      expect(d).to match /ING/i
    end

    it 'should show how the type/class Matchers work' do
      x = 1
      y = 3.14
      z = 'test string'

      # Passes when actual is an instances of the class
      expect(x).to be_instance_of Integer
      # Passes when actual is an instance of the class or any of its parent classes.
      expect(y).to be_kind_of Numeric
      # respond_to the method
      expect(z).to respond_to(:length)
    end

    it 'should show how true/false/nil matchers' do
      x = true
      y = false
      z = nil
      a = 'testing'

      expect(x).to be true
      expect(y).to be false
      expect(x).to be_truthy
      expect(a).to be_truthy
      expect(y).to be_falsey
      expect(z).to be_falsey
      expect(z).to be_nil
    end

    it 'should show error matcherss' do
      # note that the expect also takes a block (and covert it to a proc inside expect)
      expect { 1 / 0 }.to raise_error(ZeroDivisionError)
      expect { 1 / 0 }.to raise_error('divided by 0')
      expect { 1 / 0 }.to raise_error('divided by 0', ZeroDivisionError)
    end
  end
end
