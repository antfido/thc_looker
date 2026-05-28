view: sales_stg {
  sql_table_name: `@{project_id}.@{project_connection}.sales` ;;

  dimension_group: date_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: timestamp
    sql: ${TABLE}.date_date ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: products_id {
    type: string
    sql: ${TABLE}.products_id ;;
  }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  # dimension: year {
  #   type: number
  #   sql: ${TABLE}.year ;;
  # }

  # dimension: month {
  #   type: number
  #   sql: ${TABLE}.month ;;
  # }

  measure: count {
    type: count
  }
}
