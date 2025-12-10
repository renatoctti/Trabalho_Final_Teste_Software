# language: pt

Funcionalidade: Atualização de qualidade de itens comuns
  Como sistema de inventário
  Quero atualizar itens comuns corretamente
  Para manter o controle do estoque

  Cenário: Item comum degrada normalmente antes da expiração
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a 10
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 19

  Cenário: Item comum degrada duas vezes mais rápido após expiração
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a 0
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 18

  Cenário: Item comum já expirado continua degradando duplamente
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a -5
    E quality igual a 10
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -6
    E o quality deve ser 8

  Cenário: Quality de item comum nunca fica negativo
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a 5
    E quality igual a 0
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 0

  Cenário: Quality de item comum expirado com quality 1 não fica negativo
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a 0
    E quality igual a 1
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 0

  Cenário: Quality de item comum expirado com quality 0 permanece 0
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a -1
    E quality igual a 0
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -2
    E o quality deve ser 0

  Esquema do Cenário: Degradação de itens comuns em diferentes estados
    Dado um item comum com nome "<nome>"
    E sellIn igual a <sellIn_inicial>
    E quality igual a <quality_inicial>
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser <sellIn_final>
    E o quality deve ser <quality_final>

    Exemplos:
      | nome                    | sellIn_inicial | quality_inicial | sellIn_final | quality_final |
      | Elixir of the Mongoose  | 15             | 30              | 14           | 29            |
      | Elixir of the Mongoose  | 1              | 10              | 0            | 9             |
      | Elixir of the Mongoose  | 0              | 50              | -1           | 48            |
      | Elixir of the Mongoose  | -10            | 20              | -11          | 18            |
      | +5 Dexterity Vest       | 10             | 20              | 9            | 19            |

# ==============================================================================

Funcionalidade: Atualização de qualidade de Aged Brie
  Como sistema de inventário
  Quero que Aged Brie aumente de qualidade com o tempo
  Para refletir seu envelhecimento valorizado

  Cenário: Aged Brie aumenta qualidade antes da expiração
    Dado um item com nome "Aged Brie"
    E sellIn igual a 10
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 21

  Cenário: Aged Brie aumenta qualidade duas vezes mais rápido após expiração
    Dado um item com nome "Aged Brie"
    E sellIn igual a 0
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 22

  Cenário: Aged Brie já expirado continua aumentando duplamente
    Dado um item com nome "Aged Brie"
    E sellIn igual a -5
    E quality igual a 30
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -6
    E o quality deve ser 32

  Cenário: Quality de Aged Brie nunca passa de 50
    Dado um item com nome "Aged Brie"
    E sellIn igual a 10
    E quality igual a 50
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 50

  Cenário: Aged Brie expirado com quality 49 atinge máximo de 50
    Dado um item com nome "Aged Brie"
    E sellIn igual a 0
    E quality igual a 49
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 50

  Cenário: Aged Brie expirado com quality 50 permanece em 50
    Dado um item com nome "Aged Brie"
    E sellIn igual a -1
    E quality igual a 50
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -2
    E o quality deve ser 50

  Cenário: Aged Brie com quality baixo pode atingir máximo após expiração
    Dado um item com nome "Aged Brie"
    E sellIn igual a 0
    E quality igual a 48
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 50

  Esquema do Cenário: Aumento de qualidade de Aged Brie
    Dado um item com nome "Aged Brie"
    E sellIn igual a <sellIn_inicial>
    E quality igual a <quality_inicial>
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser <sellIn_final>
    E o quality deve ser <quality_final>

    Exemplos:
      | sellIn_inicial | quality_inicial | sellIn_final | quality_final |
      | 15             | 0               | 14           | 1             |
      | 5              | 25              | 4            | 26            |
      | 1              | 48              | 0            | 49            |
      | 0              | 30              | -1           | 32            |
      | -10            | 45              | -11          | 47            |

# ==============================================================================

Funcionalidade: Atualização de qualidade de Backstage Passes
  Como sistema de inventário
  Quero que passes de backstage aumentem progressivamente
  E caiam para zero após o show

  Cenário: Backstage pass aumenta 1 quando faltam mais de 10 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 15
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 14
    E o quality deve ser 21

  Cenário: Backstage pass aumenta 1 quando faltam exatamente 11 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 11
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 10
    E o quality deve ser 21

  Cenário: Backstage pass aumenta 2 quando faltam exatamente 10 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 10
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 22

  Cenário: Backstage pass aumenta 2 quando faltam entre 6 e 10 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 7
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 6
    E o quality deve ser 22

  Cenário: Backstage pass aumenta 2 quando faltam exatamente 6 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 6
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 5
    E o quality deve ser 22

  Cenário: Backstage pass aumenta 3 quando faltam exatamente 5 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 5
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 23

  Cenário: Backstage pass aumenta 3 quando faltam entre 1 e 5 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 3
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 2
    E o quality deve ser 23

  Cenário: Backstage pass aumenta 3 quando falta exatamente 1 dia
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 1
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 0
    E o quality deve ser 23

  Cenário: Backstage pass cai para 0 após o show (sellIn 0)
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 0
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 0

  Cenário: Backstage pass permanece 0 após show já ocorrido
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a -5
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -6
    E o quality deve ser 0

  Cenário: Backstage pass não ultrapassa quality 50 com 10 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 10
    E quality igual a 49
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 50

  Cenário: Backstage pass não ultrapassa quality 50 com 5 dias
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 5
    E quality igual a 48
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 50

  Cenário: Backstage pass com quality 50 permanece em 50
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a 5
    E quality igual a 50
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 50

  Esquema do Cenário: Aumento progressivo de Backstage passes
    Dado um item com nome "Backstage passes to a TAFKAL80ETC concert"
    E sellIn igual a <sellIn_inicial>
    E quality igual a <quality_inicial>
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser <sellIn_final>
    E o quality deve ser <quality_final>

    Exemplos:
      | sellIn_inicial | quality_inicial | sellIn_final | quality_final |
      | 20             | 10              | 19           | 11            |
      | 11             | 15              | 10           | 16            |
      | 10             | 15              | 9            | 17            |
      | 9              | 15              | 8            | 17            |
      | 8              | 15              | 7            | 17            |
      | 7              | 15              | 6            | 17            |
      | 6              | 15              | 5            | 17            |
      | 5              | 15              | 4            | 18            |
      | 4              | 15              | 3            | 18            |
      | 3              | 15              | 2            | 18            |
      | 2              | 15              | 1            | 18            |
      | 1              | 15              | 0            | 18            |
      | 0              | 50              | -1           | 0             |
      | -1             | 50              | -2           | 0             |

# ==============================================================================

Funcionalidade: Atualização de qualidade de Sulfuras
  Como sistema de inventário
  Quero que Sulfuras seja um item lendário imutável
  Para refletir sua natureza divina

  Cenário: Sulfuras nunca muda de qualidade com sellIn positivo
    Dado um item com nome "Sulfuras, Hand of Ragnaros"
    E sellIn igual a 10
    E quality igual a 80
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 10
    E o quality deve ser 80

  Cenário: Sulfuras nunca muda de qualidade com sellIn zero
    Dado um item com nome "Sulfuras, Hand of Ragnaros"
    E sellIn igual a 0
    E quality igual a 80
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 0
    E o quality deve ser 80

  Cenário: Sulfuras nunca muda de qualidade com sellIn negativo
    Dado um item com nome "Sulfuras, Hand of Ragnaros"
    E sellIn igual a -5
    E quality igual a 80
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -5
    E o quality deve ser 80

  Cenário: Sulfuras mantém quality diferente de 80
    Dado um item com nome "Sulfuras, Hand of Ragnaros"
    E sellIn igual a 10
    E quality igual a 100
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 10
    E o quality deve ser 100

  Esquema do Cenário: Imutabilidade de Sulfuras
    Dado um item com nome "Sulfuras, Hand of Ragnaros"
    E sellIn igual a <sellIn_inicial>
    E quality igual a <quality_inicial>
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser <sellIn_inicial>
    E o quality deve ser <quality_inicial>

    Exemplos:
      | sellIn_inicial | quality_inicial |
      | 100            | 80              |
      | 50             | 80              |
      | 10             | 80              |
      | 0              | 80              |
      | -1             | 80              |
      | -10            | 80              |
      | 5              | 100             |

# ==============================================================================

Funcionalidade: Atualização de qualidade de itens Conjured
  Como sistema de inventário
  Quero que itens Conjured degradem o dobro da velocidade
  Para refletir sua natureza mágica instável

  Cenário: Item Conjured degrada 2 pontos antes da expiração
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a 10
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 9
    E o quality deve ser 18

  Cenário: Item Conjured degrada 4 pontos após expiração
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a 0
    E quality igual a 20
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 16

  Cenário: Item Conjured expirado continua degradando 4 pontos
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a -5
    E quality igual a 10
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -6
    E o quality deve ser 6

  Cenário: Quality de Conjured nunca fica negativo
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a 5
    E quality igual a 0
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 0

  Cenário: Conjured com quality 1 não fica negativo
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a 5
    E quality igual a 1
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser 4
    E o quality deve ser 0

  Cenário: Conjured expirado com quality 3 não fica negativo
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a 0
    E quality igual a 3
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser -1
    E o quality deve ser 0

  Esquema do Cenário: Degradação dupla de Conjured
    Dado um item com nome "Conjured Mana Cake"
    E sellIn igual a <sellIn_inicial>
    E quality igual a <quality_inicial>
    Quando o sistema atualiza a qualidade
    Então o sellIn deve ser <sellIn_final>
    E o quality deve ser <quality_final>

    Exemplos:
      | sellIn_inicial | quality_inicial | sellIn_final | quality_final |
      | 15             | 30              | 14           | 28            |
      | 10             | 20              | 9            | 18            |
      | 5              | 10              | 4            | 8             |
      | 1              | 10              | 0            | 8             |
      | 0              | 50              | -1           | 46            |
      | -1             | 20              | -2           | 16            |
      | -5             | 8               | -6           | 4             |
      | 10             | 2               | 9            | 0             |
      | 0              | 2               | -1           | 0             |

# ==============================================================================

Funcionalidade: Múltiplos itens no inventário
  Como sistema de inventário
  Quero processar múltiplos itens simultaneamente
  Para atualizar todo o estoque de uma vez

  Cenário: Atualização de inventário com múltiplos tipos de itens
    Dado os seguintes itens no inventário:
      | nome                                         | sellIn | quality |
      | +5 Dexterity Vest                            | 10     | 20      |
      | Aged Brie                                    | 2      | 0       |
      | Elixir of the Mongoose                       | 5      | 7       |
      | Sulfuras, Hand of Ragnaros                   | 0      | 80      |
      | Backstage passes to a TAFKAL80ETC concert    | 15     | 20      |
      | Conjured Mana Cake                           | 3      | 6       |
    Quando o sistema atualiza a qualidade de todos os itens
    Então os itens devem ter os seguintes valores:
      | nome                                         | sellIn | quality |
      | +5 Dexterity Vest                            | 9      | 19      |
      | Aged Brie                                    | 1      | 1       |
      | Elixir of the Mongoose                       | 4      | 6       |
      | Sulfuras, Hand of Ragnaros                   | 0      | 80      |
      | Backstage passes to a TAFKAL80ETC concert    | 14     | 21      |
      | Conjured Mana Cake                           | 2      | 4       |

  Cenário: Múltiplas atualizações consecutivas
    Dado um item comum com nome "Elixir of the Mongoose"
    E sellIn igual a 5
    E quality igual a 10
    Quando o sistema atualiza a qualidade 3 vezes consecutivas
    Então o sellIn deve ser 2
    E o quality deve ser 7