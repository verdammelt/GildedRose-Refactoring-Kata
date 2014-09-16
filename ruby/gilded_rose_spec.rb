require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end

    it "it can tell it is a conjured item" do
      conjured = Item.new("Conjured item", 1, 2)
      not_conjured = Item.new("Not conjured item", 1, 2)
      expect(GildedRose.new([conjured]).is_conjured_item?(conjured)).to be true
      expect(GildedRose.new([not_conjured]).is_conjured_item?(not_conjured)).to be false
    end

    it "Backstage pass quality goes to zero after concert date" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 500)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq 0
    end

    it "positive quality, not brie, not pass, nor sulfuras" do
      items = [Item.new("test thing", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "conjured, positive quality, not brie, not pass, nor sulfuras" do
      items = [Item.new("Conjured test thing", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "is backstage pass and quality (much) less than 50 and sellin less than 11 but more than 6" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end
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
