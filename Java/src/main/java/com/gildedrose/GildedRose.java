package com.gildedrose;

class GildedRose {
    Item[] items;

    public GildedRose(Item[] items) {
        this.items = items;
    }

    public void updateQuality() {
        for (Item item : items) {
            updateItem(item);
        }
    }

    private void updateItem(Item item) {
        if (isSulfuras(item)) {
            updateSulfuras(item);
        } else if (isAgedBrie(item)) {
            updateAgedBrie(item);
        } else if (isBackstagePass(item)) {
            updateBackstagePass(item);
        } else {
            updateCommonItem(item);
        }
    }

    // ========== ITENS COMUNS ==========

    private void updateCommonItem(Item item) {
        decreaseQuality(item, 1);
        decreaseSellIn(item);
        
        if (isExpired(item)) {
            decreaseQuality(item, 1);
        }
    }

    // ========== AGED BRIE ==========

    private void updateAgedBrie(Item item) {
        increaseQuality(item, 1);
        decreaseSellIn(item);
        
        if (isExpired(item)) {
            increaseQuality(item, 1);
        }
    }

    // ========== BACKSTAGE PASSES ==========

    private void updateBackstagePass(Item item) {
        increaseQuality(item, 1);
        
        if (item.sellIn < 11) {
            increaseQuality(item, 1);
        }
        
        if (item.sellIn < 6) {
            increaseQuality(item, 1);
        }
        
        decreaseSellIn(item);
        
        if (isExpired(item)) {
            item.quality = 0;
        }
    }

    // ========== SULFURAS ==========

    private void updateSulfuras(Item item) {
        // Sulfuras nunca muda
    }

    // ========== MÉTODOS AUXILIARES ==========

    private void decreaseSellIn(Item item) {
        item.sellIn--;
    }

    private void increaseQuality(Item item, int amount) {
        item.quality = Math.min(50, item.quality + amount);
    }

    private void decreaseQuality(Item item, int amount) {
        item.quality = Math.max(0, item.quality - amount);
    }

    private boolean isExpired(Item item) {
        return item.sellIn < 0;
    }

    private boolean isAgedBrie(Item item) {
        return "Aged Brie".equals(item.name);
    }

    private boolean isBackstagePass(Item item) {
        return "Backstage passes to a TAFKAL80ETC concert".equals(item.name);
    }

    private boolean isSulfuras(Item item) {
        return "Sulfuras, Hand of Ragnaros".equals(item.name);
    }
}