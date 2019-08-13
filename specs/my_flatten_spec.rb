# Write an `Array#my_flatten` method that akes a multi-dimentional array and returns a single array of all the elements
# `[1,[2,3], [4,[5]]].my_flatten` => [1,2,3,4,5]
describe "Array#my_flatten" do
  let(:arr) { [1, 2, 3, [4, [5, 6]], [[[7]], 8]] }
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it 'flattens arrays correctly' do
    expect(arr.my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'works on one dimensional arrays' do
    expect([1,2,3,4,5].my_flatten).to eq([1,2,3,4,5])
  end
end

describe "Array#my_controlled_flatten" do
  # Write an `Array#my_controlled_flatten(n)` method that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # `[1,[2,3], [4,[5]]].my_controlled_flatten(1)` => [1,2,3,4,[5]]
  let(:arr) { [1,[2,3], [4,[5]], [[6,[7]]]] }
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it "flattens an array the specified number of levels" do
    expect(arr.my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end

  it "returns a one dimensional array when invoked without an argument" do
    expect(arr.my_controlled_flatten).to eq([1, 2, 3, 4, 5, 6, 7])
  end

  it "works on one dimensional arrays" do
    expect([1,2,3,4,5].my_controlled_flatten).to eq([1,2,3,4,5])
  end
end
