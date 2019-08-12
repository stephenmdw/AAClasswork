# Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair
describe "Hash#my_each" do
  let(:a) { {"a"=> 1, "b" => 2, "c" => 3} }
  let(:res) { Array.new }

  before do
    expect(a).not_to receive(:each)
    a.my_each {|k,v| k}
  end

  it "should call the proc on each key value pair" do
    a.my_each{|key, v| v.times{res << key}}
    expect(res.sort).to eq(["a","b","b","c","c","c"])
  end

  it "should not modify the hash" do 
    a.my_each{|key, v| v.times{res << key}}
    expect(a).to eq({"a"=> 1, "b" => 2, "c" => 3})
  end

  it "should return the original hash" do 
    expect(a.my_each{|key, v| v.times{res << key}}).to eq(a)
  end

  it "should be chainable" do 
    a.my_each do |k,v|
      v.times { res << k }
    end.my_each do |k,v|
      v.times { res << k }
    end
    expect(res).to eq(["a","b","b","c","c","c","a","b","b","c","c","c"])
  end 
end
