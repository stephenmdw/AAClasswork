# Write an `Array#my_flatten` method that akes a multi-dimentional array and returns a single array of all the elements
# `[1,[2,3], [4,[5]]].my_flatten` => [1,2,3,4,5]
describe "Array#my_flatten" do
  before(:each) do
    arr = [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
    arr.my_flatten
  end

  it 'Flattens arrays correctly' do
    expect([1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end
end

describe "Array#my_controlled_flatten" do
  # Write an `Array#my_controlled_flatten(n)` method that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # `[1,[2,3], [4,[5]]].my_controlled_flatten(1)` => [1,2,3,4,[5]]
  before(:each) do
    arr = [1,[2,3], [4,[5]], [[6,[7]]]]
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
    arr.my_controlled_flatten(1)
  end

  it "Flattens an array the specified number of levels" do
    expect([1,[2,3], [4,[5]], [[6,[7]]]].my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end
end
