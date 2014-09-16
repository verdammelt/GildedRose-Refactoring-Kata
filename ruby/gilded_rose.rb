class GildedRose

  def initialize(items)
    @items = items
  end

  def is_conjured_item?(item)
    item.name.include?("Conjured") # really should check for starts-with
  end

  def update_quality()
    @items.each do |item|
      quality_delta = 1
      name = item.name

      if is_conjured_item?(item)
        quality_delta = 2
      end

      if name != "Aged Brie" and name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - quality_delta
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + quality_delta
          if name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + quality_delta
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + quality_delta
              end
            end
          end
        end
      end
      if name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if name != "Aged Brie"
          if name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - quality_delta
              end
            end
          else
            item.quality = 0
          end
        else
          if item.quality < 50
            item.quality = item.quality + quality_delta
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class ConjuredItem < Item
end
