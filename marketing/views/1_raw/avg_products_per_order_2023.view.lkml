view: avg_products_per_order_2023 {
  sql_table_name: `astrafy-dbt-demo.transformed.avg_products_per_order_2023` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: avg_products_per_order {
    type: number
    sql: ${TABLE}.avg_products_per_order ;;
  }

  measure: count {
    type: count
  }
}