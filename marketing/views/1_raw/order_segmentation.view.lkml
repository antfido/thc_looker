view: order_segmentation {
  sql_table_name: `astrafy-dbt-demo.transformed.order_segmentation` ;;

  dimension_group: date_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: timestamp
    sql: ${TABLE}.date_date ;;
  }

  dimension: customers_id {
    type: number
    sql: ${TABLE}.customers_id ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.orders_id ;;
  }

  dimension: prior_orders_12m {
    type: number
    sql: ${TABLE}.prior_orders_12m ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  measure: count {
    type: count
  }
}