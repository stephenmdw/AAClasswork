# Write a `Hash#my_merge(other_hash)` method. This should NOT modify the original hash and 
# return a combined version of both hashes.
# ** Do NOT use `Hash#merge` **

describe "Hash#my_merge" do
  let(:hash1) { {a: 1, b: 2, c: 3} }
  let(:hash2) { {d: 4, e: 5} }
  let(:hash3) { {c: 33, d: 4, e: 5} }

  before(:each) do
    expect(hash1).not_to receive(:merge)
    expect(hash1).not_to receive(:merge!)
    hash1.my_merge(hash2)
  end

  it "Merges 2 hashes and returns a hash" do
      expect(hash1.my_merge(hash2)).to eq({ a: 1, b: 2, c: 3, d: 4, e: 5})
  end

  it "Prioritizes values from the hash being merged in" do
      expect(hash1.my_merge(hash3)).to eq({ a: 1, b: 2, c: 33, d: 4, e: 5})
  end
end
