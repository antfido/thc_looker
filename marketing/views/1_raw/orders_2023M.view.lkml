view: orders_2023M {
  sql_table_name: `@{project_id}.@{project_connection}.orders_2023M` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  measure: count {
    type: count
  }
}
