view: orders_segmented {
  sql_table_name: `@{project_id}.@{project_connection}orders_segmented` ;;

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
