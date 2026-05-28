view: orders_segmented {
  sql_table_name: `astrafy-dbt-demo.transformed.orders_segmented` ;;

  dimension: orders_id {
    type: number
    sql: ${TABLE}.orders_id ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  measure: count {
    type: count
  }
}