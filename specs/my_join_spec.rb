# Write an `Array#my_join` method. If my_join receives
# no argument, then use an empty string to join the array together.
# ex.
# ** Do NOT use `Array#join` **

# `[1,2,3].my_join` => '123'
# `[1,2,3].my_join('$')` => '1$2$3'
describe "Array#my_join" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect(array).not_to receive(:join)
  end

  it "Joins an array if no argument is passed" do
    expect(array.my_join).to eq("abcd")
  end

  it "Joins an array if an argument is passed" do
    expect(array.my_join("$")).to eq("a$b$c$d")
  end
end
