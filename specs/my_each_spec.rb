# Write an `Array#my_each(&prc)` method that calls a proc on each element of the array.
# Write an `Array#my_each_with_index(&prc)` method that calls a proc on each element with its index.
describe "Array#my_each" do
  res = []
  [1,2,3].my_each{|el| res << 2*el}

  it "It works for blocks" do
    expect(res).to eq([2,4,6])
  end
end

describe "Array#my_each_with_index" do
  res = []
  [1,2,3].my_each_with_index{|el, i| res << 2*el + i}

  it "It works for blocks that use both the index and element" do
    expect(res).to eq([2,5,8])
  end
end
