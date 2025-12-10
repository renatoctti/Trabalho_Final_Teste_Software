package com.gildedrose;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import static org.junit.jupiter.api.Assertions.assertEquals;

class GildedRoseTest {

    // ========== ITENS COMUNS ==========

    @Test
    void commonItem_shouldDecreaseQualityByOne_whenSellInPositive() {
        Item[] items = {new Item("Common Item", 10, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(19, items[0].quality);
    }

    @Test
    void commonItem_shouldDecreaseQualityByTwo_whenSellInExpired() {
        Item[] items = {new Item("Common Item", 0, 20)};
        // ❌ DUPLICATE CODE: Padrão de setup repetido em TODOS os testes
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-1, items[0].sellIn);
        assertEquals(18, items[0].quality);
    }

    @Test
    void commonItem_shouldDecreaseQualityByTwo_whenSellInNegative() {
        Item[] items = {new Item("Common Item", -5, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-6, items[0].sellIn);
        assertEquals(18, items[0].quality);
    }

    @Test
    void commonItem_shouldNotHaveNegativeQuality() {
        Item[] items = {new Item("Common Item", 10, 0)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(0, items[0].quality);
    }

    @Test
    void commonItem_shouldNotHaveNegativeQuality_whenSellInExpiredAndQualityIsOne() {
        Item[] items = {new Item("Common Item", 0, 1)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-1, items[0].sellIn);
        assertEquals(0, items[0].quality);
    }

    @Test
    void commonItem_shouldNotHaveNegativeQuality_whenSellInExpiredAndQualityIsZero() {
        Item[] items = {new Item("Common Item", -1, 0)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-2, items[0].sellIn);
        assertEquals(0, items[0].quality);
    }

    // ========== AGED BRIE ==========

    @Test
    void agedBrie_shouldIncreaseQuality_whenSellInPositive() {
        Item[] items = {new Item("Aged Brie", 10, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(21, items[0].quality);
    }

    @Test
    void agedBrie_shouldIncreaseQualityByTwo_whenSellInExpired() {
        Item[] items = {new Item("Aged Brie", 0, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-1, items[0].sellIn);
        assertEquals(22, items[0].quality);
    }

    @Test
    void agedBrie_shouldIncreaseQualityByTwo_whenSellInNegative() {
        Item[] items = {new Item("Aged Brie", -5, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-6, items[0].sellIn);
        assertEquals(22, items[0].quality);
    }

    @Test
    void agedBrie_shouldNotExceedMaxQuality() {
        Item[] items = {new Item("Aged Brie", 10, 50)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void agedBrie_shouldNotExceedMaxQuality_whenSellInExpiredAndQualityIs49() {
        Item[] items = {new Item("Aged Brie", 0, 49)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-1, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void agedBrie_shouldNotExceedMaxQuality_whenSellInExpiredAndQualityIs50() {
        Item[] items = {new Item("Aged Brie", -1, 50)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-2, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    // ========== SULFURAS ==========

    @Test
    void sulfuras_shouldNeverChangeQuality_whenSellInPositive() {
        Item[] items = {new Item("Sulfuras, Hand of Ragnaros", 10, 80)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(10, items[0].sellIn);
        assertEquals(80, items[0].quality);
    }

    @Test
    void sulfuras_shouldNeverChangeQuality_whenSellInZero() {
        Item[] items = {new Item("Sulfuras, Hand of Ragnaros", 0, 80)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(0, items[0].sellIn);
        assertEquals(80, items[0].quality);
    }

    @Test
    void sulfuras_shouldNeverChangeQuality_whenSellInNegative() {
        Item[] items = {new Item("Sulfuras, Hand of Ragnaros", -5, 80)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-5, items[0].sellIn);
        assertEquals(80, items[0].quality);
    }

    // ========== BACKSTAGE PASSES ==========

    @Test
    void backstagePass_shouldIncreaseQualityByOne_whenSellInAbove10() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(14, items[0].sellIn);
        assertEquals(21, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByOne_whenSellInIs11() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 11, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(10, items[0].sellIn);
        assertEquals(21, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByTwo_whenSellInIs10() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 10, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(22, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByTwo_whenSellInBetween6And10() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 7, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(6, items[0].sellIn);
        assertEquals(22, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByTwo_whenSellInIs6() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 6, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(5, items[0].sellIn);
        assertEquals(22, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByThree_whenSellInIs5() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 5, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(4, items[0].sellIn);
        assertEquals(23, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByThree_whenSellInBetween1And5() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 3, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(2, items[0].sellIn);
        assertEquals(23, items[0].quality);
    }

    @Test
    void backstagePass_shouldIncreaseQualityByThree_whenSellInIs1() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 1, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(0, items[0].sellIn);
        assertEquals(23, items[0].quality);
    }

    @Test
    void backstagePass_shouldDropQualityToZero_whenSellInBecomesZero() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 0, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-1, items[0].sellIn);
        assertEquals(0, items[0].quality);
    }

    @Test
    void backstagePass_shouldDropQualityToZero_whenSellInNegative() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", -5, 20)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(-6, items[0].sellIn);
        assertEquals(0, items[0].quality);
    }

    @Test
    void backstagePass_shouldNotExceedMaxQuality_whenSellInIs10AndQualityIs49() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void backstagePass_shouldNotExceedMaxQuality_whenSellInIs10AndQualityIs50() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 10, 50)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(9, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void backstagePass_shouldNotExceedMaxQuality_whenSellInIs5AndQualityIs48() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 5, 48)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(4, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void backstagePass_shouldNotExceedMaxQuality_whenSellInIs5AndQualityIs49() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(4, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    @Test
    void backstagePass_shouldNotExceedMaxQuality_whenSellInIs5AndQualityIs50() {
        Item[] items = {new Item("Backstage passes to a TAFKAL80ETC concert", 5, 50)};
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(4, items[0].sellIn);
        assertEquals(50, items[0].quality);
    }

    // ========== MÚLTIPLOS ITENS ==========

    @Test
    void shouldHandleMultipleItemsCorrectly() {
        Item[] items = {
            new Item("Common Item", 10, 20),
            new Item("Aged Brie", 5, 30),
            new Item("Sulfuras, Hand of Ragnaros", 0, 80),
            new Item("Backstage passes to a TAFKAL80ETC concert", 10, 40)
        };
        GildedRose app = new GildedRose(items);

        app.updateQuality();

        assertEquals(19, items[0].quality);
        assertEquals(31, items[1].quality);
        assertEquals(80, items[2].quality);
        assertEquals(42, items[3].quality);
        // ❌ ASSERTION ROULETTE: 4 assertions sem mensagens - qual falhou?
    
    }
    
}