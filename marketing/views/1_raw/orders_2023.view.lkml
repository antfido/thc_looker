view: orders_2023 {
  sql_table_name: `@{project_id}.@{project_connection}.orders_2023` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  measure: count {
    type: count
  }
}
