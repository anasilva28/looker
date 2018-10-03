view: order_items_factos {
  derived_table: {
    sql: SELECT
        order_items.order_id
        , COUNT(DISTINCT repeat_order_items.id) AS number_subsequent_orders
        , MIN(repeat_order_items.created_at) AS next_order_date
        , MIN(repeat_order_items.order_id) AS next_order_id
      FROM order_items
      LEFT JOIN order_items repeat_order_items
        ON order_items.user_id = repeat_order_items.user_id
        AND order_items.created_at < repeat_order_items.created_at
      GROUP BY 1;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: number_subsequent_orders {
    type: number
    sql: ${TABLE}."NUMBER_SUBSEQUENT_ORDERS" ;;
  }

  dimension_group: next_order_date {
    type: time
    sql: ${TABLE}."NEXT_ORDER_DATE" ;;
  }

  dimension: next_order_id {
    type: number
    sql: ${TABLE}."NEXT_ORDER_ID" ;;
  }

  set: detail {
    fields: [order_id, number_subsequent_orders, next_order_date_time, next_order_id]
  }

  dimension_group: proxima_encomenda {
    type: time
    timeframes: [raw, date]
    hidden: yes
    sql: ${TABLE}.next_order_date ;;
  }
}
