describe "my_reverse" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) "should NOT use built-in ruby #reverse method" do
    expect(array).not_to receive(:reverse!)
    expect(array).not_to receive(:reverse)
  end

  it "reverses an array" do
    expect(array.my_reverse).to eq(["d", "c", "b", "a"])
  end

  it "works on an array of length one" do 
    expect([1].my_reverse).to eq([1])
  end

  it "works on an empty array" do 
    expect([].my_reverse).to eq([])
  end
end
