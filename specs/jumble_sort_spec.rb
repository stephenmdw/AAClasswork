# Write a method that takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).
# **Do NOT use `Array#sort` or `Array#sort_by`

# Example:
# `jumble_sort("hello")` => "ehllo"
# `jumble_sort("hello", ['o', 'l', 'h', 'e'])` => 'ollhe'
describe "#jumble_sort" do

  before(:each) do 
    expect_any_instance_of(String).to not_receive(:sort)
    expect_any_instance_of(String).to not_receive(:sort!)
    expect_any_instance_of(String).to not_receive(:sort_by)
    expect_any_instance_of(String).to not_receive(:sort_by!)
    jumble_sort("lol")
  end

  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end

  it "works with an empty string" do
    expect(jumble_sort("")).to eq("")
  end

  it "works with a string of one item" do
    expect(jumble_sort("g")).to eq("g")
  end
end
