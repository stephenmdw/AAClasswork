# Write an `Array#my_each_with_index(&prc)` method that calls a proc on each element with its index.
describe "Array#my_each_with_index" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }
  before do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:each_with_index)
    arr.my_each_with_index {|e,i| e + i}
  end

  it "It works for blocks that use both the index and element" do
    [1,2,3].my_each_with_index{ |el, i| res << 2 * el + i }
    expect(res).to eq([2,5,8])
  end

  it "does not modify the original array" do 
    arr.my_each_with_index { |el, i| res << el * 2 + i }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each_with_index { |el, i| el + i } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each_with_index do |e,i|
      res << el * 2 + i 
    end.my_each_with_index do |e,i|
      res << el * 2 + i 
    end
    expect(res).to eq([2,5,8,2,5,8])
  end
end