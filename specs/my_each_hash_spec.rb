# Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair
describe "Hash#my_each" do
  a = {"a"=> 1, "b" => 2, "c" => 3}
  res = ""
  a.my_each{|key, v| v.times{res << key}}

  it "Calls the proc on each key value pair" do
    expect(res.chars.sort).to eq(["a","b","b","c","c","c"])
  end
end
