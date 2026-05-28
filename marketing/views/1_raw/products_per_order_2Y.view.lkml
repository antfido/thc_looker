view: products_per_order_2Y {
  sql_table_name: `@{project_id}.@{project_connection}.products_per_order_2Y` ;;

  dimension_group: date_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: timestamp
    sql: ${TABLE}.date_date ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: qty_product {
    type: number
    sql: ${TABLE}.qty_product ;;
  }

  measure: count {
    type: count
  }
}
