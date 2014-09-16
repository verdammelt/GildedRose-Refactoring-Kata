require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      items[0].name.should == "fixme"
    end
describe ConjuredItem do
  it 'should inherit from Item' do
    conjured = ConjuredItem.new('yo', 1, 10)
    expect(conjured).to respond_to(:name)
    expect(conjured).to respond_to(:sell_in)
    expect(conjured).to respond_to(:quality)
  end
end

end
