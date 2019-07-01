# Write an `Array#my_each(&prc)` method that calls a proc on each element of the array.
# Write an `Array#my_each_with_index(&prc)` method that calls a proc on each element with its index.
describe "Array#my_each" do
  let(:arr) { [1,2,3] }
  before do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:each_with_index)
    arr.my_each {|el| el}
  end

  it "It works for blocks" do
    res = []
    arr.my_each{|el| res << 2*el}
    expect(res).to eq([2,4,6])
  end
end

describe "Array#my_each_with_index" do
  let(:arr) { [1,2,3] }
  before do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:each_with_index)
    arr.my_each_with_index {|e,i| e + i}
  end

  it "It works for blocks that use both the index and element" do
    res = []
    [1,2,3].my_each_with_index{|el, i| res << 2*el + i}
    expect(res).to eq([2,5,8])
  end
end