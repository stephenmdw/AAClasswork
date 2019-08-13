# Write an `Array#my_any?(&prc)` method.
# This method should return true if any of the Array elements satisfy the block,
# otherwise it should return false.
# Example: `[1,2,3].my_any? {|n| n.even?}` => true
# `[1,3,5].my_any? {|n| n.even?}` => false
describe 'Array#my_any' do
  let(:arr) { [1,2,3] }

  before(:each) do
    expect(arr).not_to receive(:any?)
  end

  it "returns true if any number matches the block" do
    expect(arr.my_any? { |num| num > 2 }).to eq(true)
  end

  it "returns false if no elementes match the block" do
    expect(arr.my_any? { |num| num == 4 }).to eq(false)
  end
end
