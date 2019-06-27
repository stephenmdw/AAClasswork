describe "my_reverse" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) "should NOT use built-in ruby #reverse method" do
    expect(array).not_to receive(:reverse!)
    expect(array).not_to receive(:reverse)
    array.my_reverse
  end

  it "Reverses an array" do
    expect(array.my_reverse).to eq(["d", "c", "b", "a"])
  end
end
