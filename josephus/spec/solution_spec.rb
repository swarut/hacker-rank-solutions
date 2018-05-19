require_relative '../solution'
puts $LOAD_PATH
RSpec.describe Solution, "" do
  it "should be true" do
    s = Solution.new
    expect(s.hello).to eq "hello"
  end
end
