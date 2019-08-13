# Write an `Array#my_reject(&prc)` method.
# This method should return a new array excluding all the elements in the original array that satisfy the proc.
# ** Do NOT use `Array#reject` or `Array#select` **

# Example: `[1,2,3].my_reject {|n| n.even?}` => [1,3]
describe 'Array#my_reject' do
  let(:arr) { [1, 2, 3] }

  before(:each) do
    expect(arr).not_to receive(:reject)
    expect(arr).not_to receive(:reject!)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:select)
    expect(arr).not_to receive(:select!)
    expect_any_instance_of(Array).not_to receive(:reject)
    expect_any_instance_of(Array).not_to receive(:reject!)
  end

  it 'It correctly selects elements that do not match the passed in block' do
    expect(arr.my_reject { |num| num > 1 }).to eq([1])
  end

  it 'It returns all elements if no elements match the block' do
    expect(arr.my_reject { |num| num == 4 }).to eq([1,2,3])
  end
end