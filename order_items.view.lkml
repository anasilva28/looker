view: order_items {
  sql_table_name: PUBLIC.ORDER_ITEMS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
  ###################################################################################

  #######Artigos returnados

  ##artigo retornado atraves do dimensao em grupo returned
  dimension: artigo_retornado {
    type: yesno
    sql: ${returned_raw} IS NOT NULL;; #dimension_group: returned
  }

  ##nr de artigos retornados (coloco um filtro para filtrar apenas os artigos que foram retornados)
  measure: nr_artigos_retornados {
    type:  count_distinct
    sql: ${id} ;;
    filters: {
      field: artigo_retornado
      value: "yes"
    }
    drill_fields: [detail*]
  }

  ##valor total retornado
  measure: valor_total_returnado {
    type:  sum
    value_format_name: usd
    sql: ${sale_price} ;;
    filters: {
      field: artigo_retornado
      value: "yes"
    }
}
  ##valor total retornado
  measure: choquiqui {
      type:  sum
      value_format_name: usd
      sql: ${sale_price} ;;
      filters: {
        field: artigo_retornado
        value: "yes"
      }

     }

  measure: taxa_retornados {
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${nr_artigos_retornados}/nullif(${count},0) ;;
  }

  #######Entrega de encomendas

  ###nr de dias de entrega da encomenda
  dimension: dias_entrega {
    type: number
    sql:  DATEDIFF('day', ${shipped_date}, ${delivered_date}) ;;
  }

  ###média de tempo de entrega
  measure: media_dias_entrega {
    type: average
    sql: ${dias_entrega} ;;
  }

  ##nr de encomendas por status
  measure: nr_encomendas_status {
    type: count_distinct
    sql:  ${status} ;;
  }

  #######Financeiro

  ##rentabilidade das vendas
  dimension: margem_bruta {
    type: number
    value_format_name: usd
    sql: ${sale_price} -${inventory_items.cost} ;;
  }

  ##percentagem da rentabilidade das vendas

  dimension: perc_margem_bruta {
    type: number
    value_format_name: percent_2
    sql: 1.0 *${margem_bruta}/NULLIF(${sale_price},0) ;;

  }

  ##tier da percentagem de rentabilidade das vendas

  dimension: perc_margem_bruta_tier {
    type: tier
    sql: 100*${perc_margem_bruta} ;;
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
    style: interval     ##existem varios tipos: integer, relational...
  }

  ##total do preço dos artigos
  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
  }

  ##total da margem bruta
  measure: total_margem_bruta {
    type:  sum
    value_format_name: usd
    sql: ${margem_bruta} ;;
    drill_fields: [detail*]
  }

  ##media de preços~
  measure: media_preco {
    type: average
    value_format_name: usd
    sql: ${sale_price}  ;;
    drill_fields: [detail*]
  }

  ##mediana de preços
  measure: mediana_preco {
    type: median
    value_format_name: usd
    sql: ${sale_price}  ;;
    drill_fields: [detail*]
  }

  ##media da margem bruta
  measure: media_margem_bruta {
    type:  average
    value_format_name: usd
    sql: ${margem_bruta} ;;
    drill_fields: [detail*]
  }

  ##percentagem do total de margem bruta
  measure: perc_total_margem_bruta {
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_margem_bruta}/ NULLIF(${total_sale_price},0) ;;
  }

  ##media de gasto por encomenda
  measure: media_gasto_por_user {
    type: number
    value_format_name: usd
    sql: 1.0 * ${total_sale_price} / NULLIF(${users.count},0) ;; ##vai buscar o nr de utilizadores
    drill_fields: [detail*]
  }

  #######Repetição de Encomendas
  dimension: dias_ate_proxima_encomenda {
    type: number
    sql: DATEDIFF('day',${created_raw},$order_items_factos.proxima_encomenda_raw) ;;
  }

  dimension: repetiu_encomendas_dentro_30d {
    type: yesno
    sql: ${dias_ate_proxima_encomenda}<=30 ;;
  }

  measure: conta_repetiu_encomendas_dentro_30d {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: repetiu_encomendas_dentro_30d
      value: "Yes"
    }
  }

}
