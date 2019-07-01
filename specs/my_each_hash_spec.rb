# Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair
describe "Hash#my_each" do
  let(:a) { {"a"=> 1, "b" => 2, "c" => 3} }

  before do
    expect(a).not_to receive(:each)
    a.my_each {|k,v| k}
  end

  it "Calls the proc on each key value pair" do
    res = ""
    a.my_each{|key, v| v.times{res << key}}
    expect(res.chars.sort).to eq(["a","b","b","c","c","c"])
  end
end
