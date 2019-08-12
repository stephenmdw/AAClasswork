# Write an `Array#my_each(&prc)` method that calls a proc on each element of the array.
describe "Array#my_each" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }
  before do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:each_with_index)
    arr.my_each {|el| el}
  end

  it "works for blocks" do
    arr.my_each{ |el| res << 2 * el }
    expect(res).to eq([2,4,6])
  end

  it "does not modify original array" do 
    arr.my_each{ |el| res << 2 * el }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each { |el| el } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each do |el| 
      res << 2 * el
    end.my_each do |el|
      res << 3 * el 
    end 
    expect(res).to eq([2,4,6,3,6,9])
  end
end
