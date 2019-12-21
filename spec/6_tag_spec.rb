describe "How to run specific Examples with Tags" do

  # you run this flag's tests by:
  # rspec spec --tag slow
  it 'is a slow test', slow: true do
    sleep 1
    puts 'This test is slow!'
  end

  # you run this flag's tests by:
  # rspec spec --tag fast
  it 'is a fast test', fast: true do
    puts 'This test is fast!'
  end
end
