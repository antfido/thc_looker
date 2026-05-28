view: order_segmentation {
  # sql_table_name: `@{project_id}.@{project_connection}.order_segmentation` ;;

  # dimension_group: date_date {
  #   type: time
  #   timeframes: [raw, date, week, month, quarter, year]
  #   datatype: timestamp
  #   sql: ${TABLE}.date_date ;;
  # }

  # dimension: customers_id {
  #   type: number
  #   sql: ${TABLE}.customers_id ;;
  # }

  # dimension: orders_id {
  #   type: number
  #   sql: ${TABLE}.orders_id ;;
  # }

  # dimension: prior_orders_12m {
  #   type: number
  #   sql: ${TABLE}.prior_orders_12m ;;
  # }

  # dimension: segment {
  #   type: string
  #   sql: ${TABLE}.segment ;;
  # }

  # measure: count {
  #   type: count
  # }

  derived_table: {
    sql: WITH prior_orders AS (
          SELECT
              date_date,
              customers_id,
              orders_id,
              COUNT(*) OVER (
                  PARTITION BY customers_id
                  ORDER BY UNIX_DATE(DATE(date_date))
                  RANGE BETWEEN 365 PRECEDING AND 1 PRECEDING
              ) AS prior_orders_12m
          FROM ${orders_stg.SQL_TABLE_NAME}
      )

      SELECT
          date_date,
          customers_id,
          orders_id,
          prior_orders_12m,
          CASE
              WHEN prior_orders_12m = 0             THEN 'New'
              WHEN prior_orders_12m BETWEEN 1 AND 3 THEN 'Returning'
              ELSE                                       'VIP'
          END AS segment
      FROM prior_orders
      WHERE EXTRACT(YEAR FROM date_date) = 2023
      ORDER BY date_date ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_date {
    type: time
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

  set: detail {
    fields: [
      date_date_time,
      customers_id,
      orders_id,
      prior_orders_12m,
      segment
    ]
  }
}
