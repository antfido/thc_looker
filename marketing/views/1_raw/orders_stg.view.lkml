view: orders_stg {
  sql_table_name: `@{project_id}.@{project_connection}.orders` ;;

  dimension_group: date_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: timestamp
    sql: ${TABLE}.date_date ;;
  }

  dimension: customers_id {
    type: string
    sql: ${TABLE}.customers_id ;;
  }

  dimension: orders_id {
    type: string
    sql: ${TABLE}.orders_id ;;
  }

  # dimension: year {
  #   type: number
  #   sql: ${TABLE}.year ;;
  # }

  # dimension: month {
  #   type: number
  #   sql: ${TABLE}.month ;;
  # }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
  }

  measure: count {
    type: count
  }
}
